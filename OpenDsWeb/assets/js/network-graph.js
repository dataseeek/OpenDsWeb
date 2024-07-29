function networkGraph(el, data, bodyWidth, bodyHeight) {
    // Constants
    const forceVariables = {
        linkDistance: 30,
        chargeStrMultiplier: -10,
        xStr: 0.2,
        yStr: 0.2,
    };

    const groupMap = new Map([
        [
            "PRINCIPAL",
            {
                r: 60,
                image:
                    "https://dataseek.com.br/wp-content/uploads/2024/03/Agrupar-1.png",

            },
        ],
        [
            "SOCIO_PRINCIPAL",
            {
                r: 40,
                image:
                    "https://dataseek.com.br/wp-content/uploads/2023/10/Icone-titular-dados.svg",
            },
        ],
        [
            "QSA",
            {
                r: 35,
                image:
                    "https://dataseek.com.br/wp-content/uploads/2024/03/Agrupar-2.png",
            },
        ],
        [
            "SOCIO",
            {
                r: 30,
                image:
                    "https://dataseek.com.br/wp-content/uploads/2023/10/Icone-usuarios.svg",
            },
        ],
    ]);

    // Global variables
    let width, height, tooltipRect, boundsRect;

    // Make a copy of the data because force simulation will modify the data object in place. Copy the original data into a data property
    const links = data.links.map((d) => ({
        id: [d.source, d.target].join("-"),
        type: "link",
        source: d.source,
        target: d.target,
        data: d,
    }));
    const nodes = data.nodes.map((d) => ({
        id: d.id,
        type: "node",
        data: d,
        ...groupMap.get(d.tipo), // Add group related properties
    }));

    if (nodes.length < 10) {
        bodyWidth = 0;
        bodyHeight = 0;
    }

    // Fix the Firer node in the center
    const isFirer = (d) => d.data.tipo === "PRINCIPAL";
    nodes.forEach((d) => {
        if (isFirer(d)) {
            d.fx = (bodyWidth / 2) * -2.2;
            d.fy = (bodyHeight / 2) * -1.5;
        }
    });



    // Set up force simulation
    const simulation = d3
        .forceSimulation(nodes)
        .force(
            "link",
            d3
                .forceLink(links)
                .distance(forceVariables.linkDistance)
                .id((d) => d.id)
        )
        .force(
            "charge",
            d3
                .forceManyBody()
                .strength((d) => d.r * d.r * forceVariables.chargeStrMultiplier)
        )
        .force(
            "collide",
            d3
                .forceCollide()
                .radius((d) => d.r + 2)
                .iterations(2)
        )
        .force("center", d3.forceCenter())
        .force("x", d3.forceX().strength(forceVariables.xStr))
        .force("y", d3.forceY().strength(forceVariables.yStr));

    // Set up drag
    const drag = d3
        .drag()
        .on("start", dragStarted)
        .on("drag", dragged)
        .on("end", dragEnded);

    function dragStarted(d) {
        //if (isFirer(d)) return;
        if (!d3.event.active) simulation.alphaTarget(0.3).restart();
        d.fx = d.x;
        d.fy = d.y;
    }

    function dragged(d) {
        //if (isFirer(d)) return;  
        d.fx = d3.event.x;
        d.fy = d3.event.y;
    }

    function dragEnded(d) {
        //if (isFirer(d)) return;    
        if (!d3.event.active) simulation.alphaTarget(0);
        d.fx = d3.event.x;
        d.fy = d3.event.y;
        setTimeout(zoomToAll(),3000);
    }

    function clicked(d) {
        if (d.data.tipo === "PRINCIPAL" || d.data.tipo === "QSA")
            copyClipBoard(d.id);
        else
            copyClipBoardCPF(d.id);
  }

    function copyClipBoard(doc) {

        var cnpj = doc.toString();
        cnpj = cnpj.padStart(14, '0');
        
        navigator.clipboard.writeText(cnpj);        
        document.execCommand("copy");

        $.toast({
            text: "Copiado CNPJ para clipboard: " + cnpj,
            maxOpened: 1,
            autoDismiss: true,
            timeout: 2000
        });
    }

    function copyClipBoardCPF(doc) {
        var cpf = doc.toString();
        cpf = cpf.padStart(11, '0');
        navigator.clipboard.writeText(cpf);
        document.execCommand("copy");

        $.toast({
            text: "Copiado CPF para clipboard: " + cpf,
            maxOpened: 1,
            autoDismiss: true,
            timeout: 2000
        });
    }

  // Set up zoom
  const zoom = d3.zoom().on("zoom", zoomed);

  function zoomed() {
    g.attr("transform", d3.event.transform);
  }

    // When there's not enough room for the initial rendering, zoom automatically to include all nodes
    function zoomToAll() {
        const x0 = d3.min(nodes, (d) => d.x - d.r);
        const x1 = d3.max(nodes, (d) => d.x + d.r);
        const y0 = d3.min(nodes, (d) => d.y - d.r);
        const y1 = d3.max(nodes, (d) => d.y + d.r);
        const scale = Math.min(
            1,
            0.9 / Math.max((x1 - x0) / width, (y1 - y0) / height)
        );
        svg.call(
            zoom.transform,
            d3.zoomIdentity.scale(scale).translate(-(x0 + x1) / 2, -(y0 + y1) / 2)
        );
    }

  // Render
  const container = d3.select(el).append("div").attr("class", "network-graph");
  const svg = container.append("svg").call(zoom);
  const tooltip = container.append("div").attr("class", "tool-tip");

  const g = svg.append("g");

  const link = g
    .append("g")
    .attr("class", "links")
    .selectAll(".link")
    .data(links, (d) => d.id)
    .join("line")
    .attr("class", "link")
    .on("pointerenter", enteredLink)
    .on("pointermove", movedLink)
    .on("pointerleave", leftLink);

  const node = g
    .append("g")
    .attr("class", "nodes")
    .selectAll(".node")
    .data(nodes, (d) => d.id)
    .join("g")
    .attr("class", "node")
    .attr("data-group", (d) => d.data.group)
    .on("pointerenter", enteredNode)
    .on("pointermove", movedNode)
    .on("pointerleave", leftNode)
    .call(drag)
    .on("click", clicked);

  node
    .append("clipPath")
    .attr("id", (d) => `clip-${d.id}`)
    .append("circle")
    .attr("r", (d) => d.r);

  node
    .append("circle")
    .attr("class", "node__border-circle")
    .attr("r", (d) => d.r);

  node
    .append("circle")
    .attr("class", "node__shadow-circle")
    .attr("r", (d) => d.r);

  node
    .append("image")
    .attr("class", "node__image")
    .attr("clip-path", (d) => `url(#clip-${d.id})`)
    .attr("href", (d) => d.image)
    .attr("width", (d) => d.r * 2)
    .attr("height", (d) => d.r * 2)
    .attr("x", (d) => d.r * -1)
    .attr("y", (d) => d.r * -1);

  simulation.on("tick", ticked);

  function enteredLink(d) {
    node.classed("is-highlighted", (e) => e === d.source || e === d.target);
    link.classed("is-highlighted", (e) => e === d);
    showTooltip(d);
  }

  function movedLink() {
    moveTooltip();
  }

  function leftLink() {
    node.classed("is-highlighted", false);
    link.classed("is-highlighted", false);
    hideTooltip();
  }

  function enteredNode(d) {
    node.classed("is-highlighted", (e) => e === d);
    link.classed("is-highlighted", (e) => e.source === d || e.target === d);
    showTooltip(d);
  }

  function movedNode(d) {
    moveTooltip();
  }

  function leftNode() {
    node.classed("is-highlighted", false);
    link.classed("is-highlighted", false);
    hideTooltip();
  }

    function ticked() {
        link
            .attr("x1", (d) => d.source.x)
            .attr("y1", (d) => d.source.y)
            .attr("x2", (d) => d.target.x)
            .attr("y2", (d) => d.target.y);
        node.attr("transform", (d) => `translate(${d.x},${d.y})`);
    }

  // Set up tooltip
  function showTooltip(d) {
    const html = buildTooltipContent(d);
    tooltip.html(html).classed("is-visible", true);
    tooltipRect = tooltip.node().getBoundingClientRect();
    boundsRect = container.node().getBoundingClientRect();
  }

  function moveTooltip() {
    const xOffset = 16;
    const yOffset = 16;

    // Try position to the right
    let x = d3.event.x - boundsRect.x + xOffset;
    // Try position to the left
    if (x + tooltipRect.width > boundsRect.width) {
      x = d3.event.x - boundsRect.x - xOffset - tooltipRect.width;
    }
    // Make sure the left edge doesn't get cut off
    if (x < 0) {
      x = 0;
    }

    // Try position above
    let y = d3.event.y - boundsRect.y - yOffset - tooltipRect.height;
    // Try position below
    if (y < 0) {
      y = d3.event.y - boundsRect.y + yOffset;
    }
    // Make sure the bottom edge doesn't get cut off
    if (y + tooltipRect.height > boundsRect.height) {
      y = boundsRect.height - tooltipRect.height;
    }


      tooltip.style("transform", `translate(${x}px,${y}px)`);
  }

  function hideTooltip() {
    tooltip.classed("is-visible", false);
  }

  function buildTooltipContent(d) {
    const { type, data } = d;
    const rows = [];
    if (type === "link") {
      rows.push(["Connection: ", data.relationship]);
    } else if (type === "node") {
      rows.push([data.id, data.name]);
    }
    return rows.map(
      (row) => `<div>${row[0]}: <strong>${row[1]}</strong></div>`
    );
  }

  // Set up resize observer
  let ro = new ResizeObserver((entries) => {
    entries.forEach((entry) => {
      resize(entry.contentRect);
    });
  });
  ro.observe(container.node());

  let isInitialRendering = true;

  function resize(contentRect) {
    width = contentRect.width;
    height = contentRect.height;

    svg.attr("viewBox", [-width / 2, -height / 2, width, height]);

    if (isInitialRendering) {
      // During the initial rendering, the graph can extend beyond the available space. To make sure all nodes are visible on the initial rendering, we need to manually fast forward the simulation to the final layout and render it. Afterward, we can programmatically zoom to make all nodes visible.
      simulation.tick(300);
      ticked();
      zoomToAll();
      isInitialRendering = false;
    }
  }

  // Destroy function needs to be call when the graph is no longer needed
  function destroy() {
    ro.disconnect();
    ro = null;
    d3.select(el).selectAll("*").remove();
  }

  return destroy;
}
