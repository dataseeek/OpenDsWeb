/**
 * fold-to-ascii.js
 * https://github.com/mplatt/fold-to-ascii-js
 * 
 * This is a JavaScript port of the Apache Lucene ASCII Folding Filter.
 * 
 * The Apache Lucene ASCII Folding Filter is licensed to the Apache Software
 * Foundation (ASF) under one or more contributor license agreements. See the
 * NOTICE file distributed with this work for additional information regarding
 * copyright ownership. The ASF licenses this file to You under the Apache
 * License, Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 * 
 * This port uses an example from the Mozilla Developer Network published prior
 * to August 20, 2010
 * 
 * fixedCharCodeAt is licencesed under the MIT License (MIT)
 * 
 * Copyright (c) 2013 Mozilla Developer Network and individual contributors
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

(function() {
	/*
	 * True if unmapped non-ASCII characters should be replaced by the
	 * default-string.
	 * False if unmapped characters should remain in the output string.
	 */
	var replaceUnmapped = true;

	/*
	 * Default string to replace unmapped characters with
	 */
	var defaultString = "_";

	foldToASCII = function(inStr) {
		if (inStr === null) {
			return "";
		}
		
		/*
		 * The array of characters or character combinations to output
		 */
		var outStr = "";

		for (var i = 0; i < inStr.length; i++) {
			var charCode = fixedCharCodeAt(inStr, i);
			
			/*
			 * Skip low surrogates
			 */
			if (charCode) {
				if (charCode < 128) {
					/*
					 * Character within the ASCII range.
					 * Copy it to the output string.
					 */
					outStr += String.fromCharCode(charCode);
				} else {
					/*
					 * Character outside of the ASCII range.
					 * Look for a replacement
					 */
					outStr += replaceChar(charCode);
				}
			}
		}

		return outStr;
	};
	
	var fixedCharCodeAt = function(str, idx) {
		/*
		 * ex. fixedCharCodeAt ('\uD800\uDC00', 0); // 65536
		 * ex. fixedCharCodeAt ('\uD800\uDC00', 1); // 65536
		 */
		idx = idx || 0;
		var code = str.charCodeAt(idx);
		var hi, low;
		
		/*
		 * High surrogate (could change last hex to 0xDB7F to treat high
		 * private surrogates as single characters)
		 */
		if (0xD800 <= code && code <= 0xDBFF) {
			hi = code;
			low = str.charCodeAt(idx + 1);
			if (isNaN(low)) {
				throw 'High surrogate not followed by low surrogate in fixedCharCodeAt()';
			}
			return ((hi - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
		}
		if (0xDC00 <= code && code <= 0xDFFF) {
			/*
			 * Low surrogate: We return false to allow loops to skip this
			 * iteration since should have already handled high surrogate above
			 * in the previous iteration
			 */
			return false;
			/*
			 * hi = str.charCodeAt(idx-1); low = code; return ((hi - 0xD800) *
			 * 0x400) + (low - 0xDC00) + 0x10000;
			 */
		}
		return code;
	};

	/*
	 * Replaces a character with an ASCII compliant character or
	 * character-combination.
	 */
	var replaceChar = function(charCode) {
		var outString = "";

		switch (charCode) {
			case 0xC0: // À	[LATIN CAPITAL LETTER A WITH GRAVE]
			case 0xC1: // Á	[LATIN CAPITAL LETTER A WITH ACUTE]
			case 0xC2: // Â	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX]
			case 0xC3: // Ã	[LATIN CAPITAL LETTER A WITH TILDE]
			case 0xC4: // Ä	[LATIN CAPITAL LETTER A WITH DIAERESIS]
			case 0xC5: // Å	[LATIN CAPITAL LETTER A WITH RING ABOVE]
			case 0x100: // A	[LATIN CAPITAL LETTER A WITH MACRON]
			case 0x102: // A	[LATIN CAPITAL LETTER A WITH BREVE]
			case 0x104: // A	[LATIN CAPITAL LETTER A WITH OGONEK]
			case 0x18F: // ?	http://en.wikipedia.org/wiki/Schwa	[LATIN CAPITAL LETTER SCHWA]
			case 0x1CD: // A	[LATIN CAPITAL LETTER A WITH CARON]
			case 0x1DE: // A	[LATIN CAPITAL LETTER A WITH DIAERESIS AND MACRON]
			case 0x1E0: // ?	[LATIN CAPITAL LETTER A WITH DOT ABOVE AND MACRON]
			case 0x1FA: // ?	[LATIN CAPITAL LETTER A WITH RING ABOVE AND ACUTE]
			case 0x200: // ?	[LATIN CAPITAL LETTER A WITH DOUBLE GRAVE]
			case 0x202: // ?	[LATIN CAPITAL LETTER A WITH INVERTED BREVE]
			case 0x226: // ?	[LATIN CAPITAL LETTER A WITH DOT ABOVE]
			case 0x23A: // ?	[LATIN CAPITAL LETTER A WITH STROKE]
			case 0x1D00: // ?	[LATIN LETTER SMALL CAPITAL A]
			case 0x1E00: // ?	[LATIN CAPITAL LETTER A WITH RING BELOW]
			case 0x1EA0: // ?	[LATIN CAPITAL LETTER A WITH DOT BELOW]
			case 0x1EA2: // ?	[LATIN CAPITAL LETTER A WITH HOOK ABOVE]
			case 0x1EA4: // ?	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE]
			case 0x1EA6: // ?	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE]
			case 0x1EA8: // ?	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1EAA: // ?	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE]
			case 0x1EAC: // ?	[LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND DOT BELOW]
			case 0x1EAE: // ?	[LATIN CAPITAL LETTER A WITH BREVE AND ACUTE]
			case 0x1EB0: // ?	[LATIN CAPITAL LETTER A WITH BREVE AND GRAVE]
			case 0x1EB2: // ?	[LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE]
			case 0x1EB4: // ?	[LATIN CAPITAL LETTER A WITH BREVE AND TILDE]
			case 0x1EB6: // ?	[LATIN CAPITAL LETTER A WITH BREVE AND DOT BELOW]
			case 0x24B6: // ?	[CIRCLED LATIN CAPITAL LETTER A]
			case 0xFF21: // A	[FULLWIDTH LATIN CAPITAL LETTER A]
				outString += "A";
				break;
			case 0xE0: // à	[LATIN SMALL LETTER A WITH GRAVE]
			case 0xE1: // á	[LATIN SMALL LETTER A WITH ACUTE]
			case 0xE2: // â	[LATIN SMALL LETTER A WITH CIRCUMFLEX]
			case 0xE3: // ã	[LATIN SMALL LETTER A WITH TILDE]
			case 0xE4: // ä	[LATIN SMALL LETTER A WITH DIAERESIS]
			case 0xE5: // å	[LATIN SMALL LETTER A WITH RING ABOVE]
			case 0x101: // a	[LATIN SMALL LETTER A WITH MACRON]
			case 0x103: // a	[LATIN SMALL LETTER A WITH BREVE]
			case 0x105: // a	[LATIN SMALL LETTER A WITH OGONEK]
			case 0x1CE: // a	[LATIN SMALL LETTER A WITH CARON]
			case 0x1DF: // a	[LATIN SMALL LETTER A WITH DIAERESIS AND MACRON]
			case 0x1E1: // ?	[LATIN SMALL LETTER A WITH DOT ABOVE AND MACRON]
			case 0x1FB: // ?	[LATIN SMALL LETTER A WITH RING ABOVE AND ACUTE]
			case 0x201: // ?	[LATIN SMALL LETTER A WITH DOUBLE GRAVE]
			case 0x203: // ?	[LATIN SMALL LETTER A WITH INVERTED BREVE]
			case 0x227: // ?	[LATIN SMALL LETTER A WITH DOT ABOVE]
			case 0x250: // ?	[LATIN SMALL LETTER TURNED A]
			case 0x259: // ?	[LATIN SMALL LETTER SCHWA]
			case 0x25A: // ?	[LATIN SMALL LETTER SCHWA WITH HOOK]
			case 0x1D8F: // ?	[LATIN SMALL LETTER A WITH RETROFLEX HOOK]
			case 0x1D95: // ?	[LATIN SMALL LETTER SCHWA WITH RETROFLEX HOOK]
			case 0x1E01: // ?	[LATIN SMALL LETTER A WITH RING BELOW]
			case 0x1E9A: // ?	[LATIN SMALL LETTER A WITH RIGHT HALF RING]
			case 0x1EA1: // ?	[LATIN SMALL LETTER A WITH DOT BELOW]
			case 0x1EA3: // ?	[LATIN SMALL LETTER A WITH HOOK ABOVE]
			case 0x1EA5: // ?	[LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE]
			case 0x1EA7: // ?	[LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE]
			case 0x1EA9: // ?	[LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1EAB: // ?	[LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE]
			case 0x1EAD: // ?	[LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW]
			case 0x1EAF: // ?	[LATIN SMALL LETTER A WITH BREVE AND ACUTE]
			case 0x1EB1: // ?	[LATIN SMALL LETTER A WITH BREVE AND GRAVE]
			case 0x1EB3: // ?	[LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE]
			case 0x1EB5: // ?	[LATIN SMALL LETTER A WITH BREVE AND TILDE]
			case 0x1EB7: // ?	[LATIN SMALL LETTER A WITH BREVE AND DOT BELOW]
			case 0x2090: // ?	[LATIN SUBSCRIPT SMALL LETTER A]
			case 0x2094: // ?	[LATIN SUBSCRIPT SMALL LETTER SCHWA]
			case 0x24D0: // ?	[CIRCLED LATIN SMALL LETTER A]
			case 0x2C65: // ?	[LATIN SMALL LETTER A WITH STROKE]
			case 0x2C6F: // ?	[LATIN CAPITAL LETTER TURNED A]
			case 0xFF41: // a	[FULLWIDTH LATIN SMALL LETTER A]
				outString += "a";
				break;
			case 0xA732: // ?	[LATIN CAPITAL LETTER AA]
				outString += "A";
				outString += "A";
				break;
			case 0xC6: // Æ	[LATIN CAPITAL LETTER AE]
			case 0x1E2: // ?	[LATIN CAPITAL LETTER AE WITH MACRON]
			case 0x1FC: // ?	[LATIN CAPITAL LETTER AE WITH ACUTE]
			case 0x1D01: // ?	[LATIN LETTER SMALL CAPITAL AE]
				outString += "A";
				outString += "E";
				break;
			case 0xA734: // ?	[LATIN CAPITAL LETTER AO]
				outString += "A";
				outString += "O";
				break;
			case 0xA736: // ?	[LATIN CAPITAL LETTER AU]
				outString += "A";
				outString += "U";
				break;
			case 0xA738: // ?	[LATIN CAPITAL LETTER AV]
			case 0xA73A: // ?	[LATIN CAPITAL LETTER AV WITH HORIZONTAL BAR]
				outString += "A";
				outString += "V";
				break;
			case 0xA73C: // ?	[LATIN CAPITAL LETTER AY]
				outString += "A";
				outString += "Y";
				break;
			case 0x249C: // ?	[PARENTHESIZED LATIN SMALL LETTER A]
				outString += "(";
				outString += "a";
				outString += ")";
				break;
			case 0xA733: // ?	[LATIN SMALL LETTER AA]
				outString += "a";
				outString += "a";
				break;
			case 0xE6: // æ	[LATIN SMALL LETTER AE]
			case 0x1E3: // ?	[LATIN SMALL LETTER AE WITH MACRON]
			case 0x1FD: // ?	[LATIN SMALL LETTER AE WITH ACUTE]
			case 0x1D02: // ?	[LATIN SMALL LETTER TURNED AE]
				outString += "a";
				outString += "e";
				break;
			case 0xA735: // ?	[LATIN SMALL LETTER AO]
				outString += "a";
				outString += "o";
				break;
			case 0xA737: // ?	[LATIN SMALL LETTER AU]
				outString += "a";
				outString += "u";
				break;
			case 0xA739: // ?	[LATIN SMALL LETTER AV]
			case 0xA73B: // ?	[LATIN SMALL LETTER AV WITH HORIZONTAL BAR]
				outString += "a";
				outString += "v";
				break;
			case 0xA73D: // ?	[LATIN SMALL LETTER AY]
				outString += "a";
				outString += "y";
				break;
			case 0x181: // ?	[LATIN CAPITAL LETTER B WITH HOOK]
			case 0x182: // ?	[LATIN CAPITAL LETTER B WITH TOPBAR]
			case 0x243: // ?	[LATIN CAPITAL LETTER B WITH STROKE]
			case 0x299: // ?	[LATIN LETTER SMALL CAPITAL B]
			case 0x1D03: // ?	[LATIN LETTER SMALL CAPITAL BARRED B]
			case 0x1E02: // ?	[LATIN CAPITAL LETTER B WITH DOT ABOVE]
			case 0x1E04: // ?	[LATIN CAPITAL LETTER B WITH DOT BELOW]
			case 0x1E06: // ?	[LATIN CAPITAL LETTER B WITH LINE BELOW]
			case 0x24B7: // ?	[CIRCLED LATIN CAPITAL LETTER B]
			case 0xFF22: // B	[FULLWIDTH LATIN CAPITAL LETTER B]
				outString += "B";
				break;
			case 0x180: // b	[LATIN SMALL LETTER B WITH STROKE]
			case 0x183: // ?	[LATIN SMALL LETTER B WITH TOPBAR]
			case 0x253: // ?	[LATIN SMALL LETTER B WITH HOOK]
			case 0x1D6C: // ?	[LATIN SMALL LETTER B WITH MIDDLE TILDE]
			case 0x1D80: // ?	[LATIN SMALL LETTER B WITH PALATAL HOOK]
			case 0x1E03: // ?	[LATIN SMALL LETTER B WITH DOT ABOVE]
			case 0x1E05: // ?	[LATIN SMALL LETTER B WITH DOT BELOW]
			case 0x1E07: // ?	[LATIN SMALL LETTER B WITH LINE BELOW]
			case 0x24D1: // ?	[CIRCLED LATIN SMALL LETTER B]
			case 0xFF42: // b	[FULLWIDTH LATIN SMALL LETTER B]
				outString += "b";
				break;
			case 0x249D: // ?	[PARENTHESIZED LATIN SMALL LETTER B]
				outString += "(";
				outString += "b";
				outString += ")";
				break;
			case 0xC7: // Ç	[LATIN CAPITAL LETTER C WITH CEDILLA]
			case 0x106: // C	[LATIN CAPITAL LETTER C WITH ACUTE]
			case 0x108: // C	[LATIN CAPITAL LETTER C WITH CIRCUMFLEX]
			case 0x10A: // C	[LATIN CAPITAL LETTER C WITH DOT ABOVE]
			case 0x10C: // C	[LATIN CAPITAL LETTER C WITH CARON]
			case 0x187: // ?	[LATIN CAPITAL LETTER C WITH HOOK]
			case 0x23B: // ?	[LATIN CAPITAL LETTER C WITH STROKE]
			case 0x297: // ?	[LATIN LETTER STRETCHED C]
			case 0x1D04: // ?	[LATIN LETTER SMALL CAPITAL C]
			case 0x1E08: // ?	[LATIN CAPITAL LETTER C WITH CEDILLA AND ACUTE]
			case 0x24B8: // ?	[CIRCLED LATIN CAPITAL LETTER C]
			case 0xFF23: // C	[FULLWIDTH LATIN CAPITAL LETTER C]
				outString += "C";
				break;
			case 0xE7: // ç	[LATIN SMALL LETTER C WITH CEDILLA]
			case 0x107: // c	[LATIN SMALL LETTER C WITH ACUTE]
			case 0x109: // c	[LATIN SMALL LETTER C WITH CIRCUMFLEX]
			case 0x10B: // c	[LATIN SMALL LETTER C WITH DOT ABOVE]
			case 0x10D: // c	[LATIN SMALL LETTER C WITH CARON]
			case 0x188: // ?	[LATIN SMALL LETTER C WITH HOOK]
			case 0x23C: // ?	[LATIN SMALL LETTER C WITH STROKE]
			case 0x255: // ?	[LATIN SMALL LETTER C WITH CURL]
			case 0x1E09: // ?	[LATIN SMALL LETTER C WITH CEDILLA AND ACUTE]
			case 0x2184: // ?	[LATIN SMALL LETTER REVERSED C]
			case 0x24D2: // ?	[CIRCLED LATIN SMALL LETTER C]
			case 0xA73E: // ?	[LATIN CAPITAL LETTER REVERSED C WITH DOT]
			case 0xA73F: // ?	[LATIN SMALL LETTER REVERSED C WITH DOT]
			case 0xFF43: // c	[FULLWIDTH LATIN SMALL LETTER C]
				outString += "c";
				break;
			case 0x249E: // ?	[PARENTHESIZED LATIN SMALL LETTER C]
				outString += "(";
				outString += "c";
				outString += ")";
				break;
			case 0xD0: // Ð	[LATIN CAPITAL LETTER ETH]
			case 0x10E: // D	[LATIN CAPITAL LETTER D WITH CARON]
			case 0x110: // Ð	[LATIN CAPITAL LETTER D WITH STROKE]
			case 0x189: // Ð	[LATIN CAPITAL LETTER AFRICAN D]
			case 0x18A: // ?	[LATIN CAPITAL LETTER D WITH HOOK]
			case 0x18B: // ?	[LATIN CAPITAL LETTER D WITH TOPBAR]
			case 0x1D05: // ?	[LATIN LETTER SMALL CAPITAL D]
			case 0x1D06: // ?	[LATIN LETTER SMALL CAPITAL ETH]
			case 0x1E0A: // ?	[LATIN CAPITAL LETTER D WITH DOT ABOVE]
			case 0x1E0C: // ?	[LATIN CAPITAL LETTER D WITH DOT BELOW]
			case 0x1E0E: // ?	[LATIN CAPITAL LETTER D WITH LINE BELOW]
			case 0x1E10: // ?	[LATIN CAPITAL LETTER D WITH CEDILLA]
			case 0x1E12: // ?	[LATIN CAPITAL LETTER D WITH CIRCUMFLEX BELOW]
			case 0x24B9: // ?	[CIRCLED LATIN CAPITAL LETTER D]
			case 0xA779: // ?	[LATIN CAPITAL LETTER INSULAR D]
			case 0xFF24: // D	[FULLWIDTH LATIN CAPITAL LETTER D]
				outString += "D";
				break;
			case 0xF0: // ð	[LATIN SMALL LETTER ETH]
			case 0x10F: // d	[LATIN SMALL LETTER D WITH CARON]
			case 0x111: // d	[LATIN SMALL LETTER D WITH STROKE]
			case 0x18C: // ?	[LATIN SMALL LETTER D WITH TOPBAR]
			case 0x221: // ?	[LATIN SMALL LETTER D WITH CURL]
			case 0x256: // ?	[LATIN SMALL LETTER D WITH TAIL]
			case 0x257: // ?	[LATIN SMALL LETTER D WITH HOOK]
			case 0x1D6D: // ?	[LATIN SMALL LETTER D WITH MIDDLE TILDE]
			case 0x1D81: // ?	[LATIN SMALL LETTER D WITH PALATAL HOOK]
			case 0x1D91: // ?	[LATIN SMALL LETTER D WITH HOOK AND TAIL]
			case 0x1E0B: // ?	[LATIN SMALL LETTER D WITH DOT ABOVE]
			case 0x1E0D: // ?	[LATIN SMALL LETTER D WITH DOT BELOW]
			case 0x1E0F: // ?	[LATIN SMALL LETTER D WITH LINE BELOW]
			case 0x1E11: // ?	[LATIN SMALL LETTER D WITH CEDILLA]
			case 0x1E13: // ?	[LATIN SMALL LETTER D WITH CIRCUMFLEX BELOW]
			case 0x24D3: // ?	[CIRCLED LATIN SMALL LETTER D]
			case 0xA77A: // ?	[LATIN SMALL LETTER INSULAR D]
			case 0xFF44: // d	[FULLWIDTH LATIN SMALL LETTER D]
				outString += "d";
				break;
			case 0x1C4: // ?	[LATIN CAPITAL LETTER DZ WITH CARON]
			case 0x1F1: // ?	[LATIN CAPITAL LETTER DZ]
				outString += "D";
				outString += "Z";
				break;
			case 0x1C5: // ?	[LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON]
			case 0x1F2: // ?	[LATIN CAPITAL LETTER D WITH SMALL LETTER Z]
				outString += "D";
				outString += "z";
				break;
			case 0x249F: // ?	[PARENTHESIZED LATIN SMALL LETTER D]
				outString += "(";
				outString += "d";
				outString += ")";
				break;
			case 0x238: // ?	[LATIN SMALL LETTER DB DIGRAPH]
				outString += "d";
				outString += "b";
				break;
			case 0x1C6: // ?	[LATIN SMALL LETTER DZ WITH CARON]
			case 0x1F3: // ?	[LATIN SMALL LETTER DZ]
			case 0x2A3: // ?	[LATIN SMALL LETTER DZ DIGRAPH]
			case 0x2A5: // ?	[LATIN SMALL LETTER DZ DIGRAPH WITH CURL]
				outString += "d";
				outString += "z";
				break;
			case 0xC8: // È	[LATIN CAPITAL LETTER E WITH GRAVE]
			case 0xC9: // É	[LATIN CAPITAL LETTER E WITH ACUTE]
			case 0xCA: // Ê	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX]
			case 0xCB: // Ë	[LATIN CAPITAL LETTER E WITH DIAERESIS]
			case 0x112: // E	[LATIN CAPITAL LETTER E WITH MACRON]
			case 0x114: // E	[LATIN CAPITAL LETTER E WITH BREVE]
			case 0x116: // E	[LATIN CAPITAL LETTER E WITH DOT ABOVE]
			case 0x118: // E	[LATIN CAPITAL LETTER E WITH OGONEK]
			case 0x11A: // E	[LATIN CAPITAL LETTER E WITH CARON]
			case 0x18E: // ?	[LATIN CAPITAL LETTER REVERSED E]
			case 0x190: // ?	[LATIN CAPITAL LETTER OPEN E]
			case 0x204: // ?	[LATIN CAPITAL LETTER E WITH DOUBLE GRAVE]
			case 0x206: // ?	[LATIN CAPITAL LETTER E WITH INVERTED BREVE]
			case 0x228: // ?	[LATIN CAPITAL LETTER E WITH CEDILLA]
			case 0x246: // ?	[LATIN CAPITAL LETTER E WITH STROKE]
			case 0x1D07: // ?	[LATIN LETTER SMALL CAPITAL E]
			case 0x1E14: // ?	[LATIN CAPITAL LETTER E WITH MACRON AND GRAVE]
			case 0x1E16: // ?	[LATIN CAPITAL LETTER E WITH MACRON AND ACUTE]
			case 0x1E18: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX BELOW]
			case 0x1E1A: // ?	[LATIN CAPITAL LETTER E WITH TILDE BELOW]
			case 0x1E1C: // ?	[LATIN CAPITAL LETTER E WITH CEDILLA AND BREVE]
			case 0x1EB8: // ?	[LATIN CAPITAL LETTER E WITH DOT BELOW]
			case 0x1EBA: // ?	[LATIN CAPITAL LETTER E WITH HOOK ABOVE]
			case 0x1EBC: // ?	[LATIN CAPITAL LETTER E WITH TILDE]
			case 0x1EBE: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE]
			case 0x1EC0: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE]
			case 0x1EC2: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1EC4: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE]
			case 0x1EC6: // ?	[LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW]
			case 0x24BA: // ?	[CIRCLED LATIN CAPITAL LETTER E]
			case 0x2C7B: // ?	[LATIN LETTER SMALL CAPITAL TURNED E]
			case 0xFF25: // E	[FULLWIDTH LATIN CAPITAL LETTER E]
				outString += "E";
				break;
			case 0xE8: // è	[LATIN SMALL LETTER E WITH GRAVE]
			case 0xE9: // é	[LATIN SMALL LETTER E WITH ACUTE]
			case 0xEA: // ê	[LATIN SMALL LETTER E WITH CIRCUMFLEX]
			case 0xEB: // ë	[LATIN SMALL LETTER E WITH DIAERESIS]
			case 0x113: // e	[LATIN SMALL LETTER E WITH MACRON]
			case 0x115: // e	[LATIN SMALL LETTER E WITH BREVE]
			case 0x117: // e	[LATIN SMALL LETTER E WITH DOT ABOVE]
			case 0x119: // e	[LATIN SMALL LETTER E WITH OGONEK]
			case 0x11B: // e	[LATIN SMALL LETTER E WITH CARON]
			case 0x1DD: // ?	[LATIN SMALL LETTER TURNED E]
			case 0x205: // ?	[LATIN SMALL LETTER E WITH DOUBLE GRAVE]
			case 0x207: // ?	[LATIN SMALL LETTER E WITH INVERTED BREVE]
			case 0x229: // ?	[LATIN SMALL LETTER E WITH CEDILLA]
			case 0x247: // ?	[LATIN SMALL LETTER E WITH STROKE]
			case 0x258: // ?	[LATIN SMALL LETTER REVERSED E]
			case 0x25B: // ?	[LATIN SMALL LETTER OPEN E]
			case 0x25C: // ?	[LATIN SMALL LETTER REVERSED OPEN E]
			case 0x25D: // ?	[LATIN SMALL LETTER REVERSED OPEN E WITH HOOK]
			case 0x25E: // ?	[LATIN SMALL LETTER CLOSED REVERSED OPEN E]
			case 0x29A: // ?	[LATIN SMALL LETTER CLOSED OPEN E]
			case 0x1D08: // ?	[LATIN SMALL LETTER TURNED OPEN E]
			case 0x1D92: // ?	[LATIN SMALL LETTER E WITH RETROFLEX HOOK]
			case 0x1D93: // ?	[LATIN SMALL LETTER OPEN E WITH RETROFLEX HOOK]
			case 0x1D94: // ?	[LATIN SMALL LETTER REVERSED OPEN E WITH RETROFLEX HOOK]
			case 0x1E15: // ?	[LATIN SMALL LETTER E WITH MACRON AND GRAVE]
			case 0x1E17: // ?	[LATIN SMALL LETTER E WITH MACRON AND ACUTE]
			case 0x1E19: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX BELOW]
			case 0x1E1B: // ?	[LATIN SMALL LETTER E WITH TILDE BELOW]
			case 0x1E1D: // ?	[LATIN SMALL LETTER E WITH CEDILLA AND BREVE]
			case 0x1EB9: // ?	[LATIN SMALL LETTER E WITH DOT BELOW]
			case 0x1EBB: // ?	[LATIN SMALL LETTER E WITH HOOK ABOVE]
			case 0x1EBD: // ?	[LATIN SMALL LETTER E WITH TILDE]
			case 0x1EBF: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE]
			case 0x1EC1: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE]
			case 0x1EC3: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1EC5: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE]
			case 0x1EC7: // ?	[LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW]
			case 0x2091: // ?	[LATIN SUBSCRIPT SMALL LETTER E]
			case 0x24D4: // ?	[CIRCLED LATIN SMALL LETTER E]
			case 0x2C78: // ?	[LATIN SMALL LETTER E WITH NOTCH]
			case 0xFF45: // e	[FULLWIDTH LATIN SMALL LETTER E]
				outString += "e";
				break;
			case 0x24A0: // ?	[PARENTHESIZED LATIN SMALL LETTER E]
				outString += "(";
				outString += "e";
				outString += ")";
				break;
			case 0x191: // ƒ	[LATIN CAPITAL LETTER F WITH HOOK]
			case 0x1E1E: // ?	[LATIN CAPITAL LETTER F WITH DOT ABOVE]
			case 0x24BB: // ?	[CIRCLED LATIN CAPITAL LETTER F]
			case 0xA730: // ?	[LATIN LETTER SMALL CAPITAL F]
			case 0xA77B: // ?	[LATIN CAPITAL LETTER INSULAR F]
			case 0xA7FB: // ?	[LATIN EPIGRAPHIC LETTER REVERSED F]
			case 0xFF26: // F	[FULLWIDTH LATIN CAPITAL LETTER F]
				outString += "F";
				break;
			case 0x192: // ƒ	[LATIN SMALL LETTER F WITH HOOK]
			case 0x1D6E: // ?	[LATIN SMALL LETTER F WITH MIDDLE TILDE]
			case 0x1D82: // ?	[LATIN SMALL LETTER F WITH PALATAL HOOK]
			case 0x1E1F: // ?	[LATIN SMALL LETTER F WITH DOT ABOVE]
			case 0x1E9B: // ?	[LATIN SMALL LETTER LONG S WITH DOT ABOVE]
			case 0x24D5: // ?	[CIRCLED LATIN SMALL LETTER F]
			case 0xA77C: // ?	[LATIN SMALL LETTER INSULAR F]
			case 0xFF46: // f	[FULLWIDTH LATIN SMALL LETTER F]
				outString += "f";
				break;
			case 0x24A1: // ?	[PARENTHESIZED LATIN SMALL LETTER F]
				outString += "(";
				outString += "f";
				outString += ")";
				break;
			case 0xFB00: // ?	[LATIN SMALL LIGATURE FF]
				outString += "f";
				outString += "f";
				break;
			case 0xFB03: // ?	[LATIN SMALL LIGATURE FFI]
				outString += "f";
				outString += "f";
				outString += "i";
				break;
			case 0xFB04: // ?	[LATIN SMALL LIGATURE FFL]
				outString += "f";
				outString += "f";
				outString += "l";
				break;
			case 0xFB01: // ?	[LATIN SMALL LIGATURE FI]
				outString += "f";
				outString += "i";
				break;
			case 0xFB02: // ?	[LATIN SMALL LIGATURE FL]
				outString += "f";
				outString += "l";
				break;
			case 0x11C: // G	[LATIN CAPITAL LETTER G WITH CIRCUMFLEX]
			case 0x11E: // G	[LATIN CAPITAL LETTER G WITH BREVE]
			case 0x120: // G	[LATIN CAPITAL LETTER G WITH DOT ABOVE]
			case 0x122: // G	[LATIN CAPITAL LETTER G WITH CEDILLA]
			case 0x193: // ?	[LATIN CAPITAL LETTER G WITH HOOK]
			case 0x1E4: // G	[LATIN CAPITAL LETTER G WITH STROKE]
			case 0x1E5: // g	[LATIN SMALL LETTER G WITH STROKE]
			case 0x1E6: // G	[LATIN CAPITAL LETTER G WITH CARON]
			case 0x1E7: // g	[LATIN SMALL LETTER G WITH CARON]
			case 0x1F4: // ?	[LATIN CAPITAL LETTER G WITH ACUTE]
			case 0x262: // ?	[LATIN LETTER SMALL CAPITAL G]
			case 0x29B: // ?	[LATIN LETTER SMALL CAPITAL G WITH HOOK]
			case 0x1E20: // ?	[LATIN CAPITAL LETTER G WITH MACRON]
			case 0x24BC: // ?	[CIRCLED LATIN CAPITAL LETTER G]
			case 0xA77D: // ?	[LATIN CAPITAL LETTER INSULAR G]
			case 0xA77E: // ?	[LATIN CAPITAL LETTER TURNED INSULAR G]
			case 0xFF27: // G	[FULLWIDTH LATIN CAPITAL LETTER G]
				outString += "G";
				break;
			case 0x11D: // g	[LATIN SMALL LETTER G WITH CIRCUMFLEX]
			case 0x11F: // g	[LATIN SMALL LETTER G WITH BREVE]
			case 0x121: // g	[LATIN SMALL LETTER G WITH DOT ABOVE]
			case 0x123: // g	[LATIN SMALL LETTER G WITH CEDILLA]
			case 0x1F5: // ?	[LATIN SMALL LETTER G WITH ACUTE]
			case 0x260: // ?	[LATIN SMALL LETTER G WITH HOOK]
			case 0x261: // g	[LATIN SMALL LETTER SCRIPT G]
			case 0x1D77: // ?	[LATIN SMALL LETTER TURNED G]
			case 0x1D79: // ?	[LATIN SMALL LETTER INSULAR G]
			case 0x1D83: // ?	[LATIN SMALL LETTER G WITH PALATAL HOOK]
			case 0x1E21: // ?	[LATIN SMALL LETTER G WITH MACRON]
			case 0x24D6: // ?	[CIRCLED LATIN SMALL LETTER G]
			case 0xA77F: // ?	[LATIN SMALL LETTER TURNED INSULAR G]
			case 0xFF47: // g	[FULLWIDTH LATIN SMALL LETTER G]
				outString += "g";
				break;
			case 0x24A2: // ?	[PARENTHESIZED LATIN SMALL LETTER G]
				outString += "(";
				outString += "g";
				outString += ")";
				break;
			case 0x124: // H	[LATIN CAPITAL LETTER H WITH CIRCUMFLEX]
			case 0x126: // H	[LATIN CAPITAL LETTER H WITH STROKE]
			case 0x21E: // ?	[LATIN CAPITAL LETTER H WITH CARON]
			case 0x29C: // ?	[LATIN LETTER SMALL CAPITAL H]
			case 0x1E22: // ?	[LATIN CAPITAL LETTER H WITH DOT ABOVE]
			case 0x1E24: // ?	[LATIN CAPITAL LETTER H WITH DOT BELOW]
			case 0x1E26: // ?	[LATIN CAPITAL LETTER H WITH DIAERESIS]
			case 0x1E28: // ?	[LATIN CAPITAL LETTER H WITH CEDILLA]
			case 0x1E2A: // ?	[LATIN CAPITAL LETTER H WITH BREVE BELOW]
			case 0x24BD: // ?	[CIRCLED LATIN CAPITAL LETTER H]
			case 0x2C67: // ?	[LATIN CAPITAL LETTER H WITH DESCENDER]
			case 0x2C75: // ?	[LATIN CAPITAL LETTER HALF H]
			case 0xFF28: // H	[FULLWIDTH LATIN CAPITAL LETTER H]
				outString += "H";
				break;
			case 0x125: // h	[LATIN SMALL LETTER H WITH CIRCUMFLEX]
			case 0x127: // h	[LATIN SMALL LETTER H WITH STROKE]
			case 0x21F: // ?	[LATIN SMALL LETTER H WITH CARON]
			case 0x265: // ?	[LATIN SMALL LETTER TURNED H]
			case 0x266: // ?	[LATIN SMALL LETTER H WITH HOOK]
			case 0x2AE: // ?	[LATIN SMALL LETTER TURNED H WITH FISHHOOK]
			case 0x2AF: // ?	[LATIN SMALL LETTER TURNED H WITH FISHHOOK AND TAIL]
			case 0x1E23: // ?	[LATIN SMALL LETTER H WITH DOT ABOVE]
			case 0x1E25: // ?	[LATIN SMALL LETTER H WITH DOT BELOW]
			case 0x1E27: // ?	[LATIN SMALL LETTER H WITH DIAERESIS]
			case 0x1E29: // ?	[LATIN SMALL LETTER H WITH CEDILLA]
			case 0x1E2B: // ?	[LATIN SMALL LETTER H WITH BREVE BELOW]
			case 0x1E96: // ?	[LATIN SMALL LETTER H WITH LINE BELOW]
			case 0x24D7: // ?	[CIRCLED LATIN SMALL LETTER H]
			case 0x2C68: // ?	[LATIN SMALL LETTER H WITH DESCENDER]
			case 0x2C76: // ?	[LATIN SMALL LETTER HALF H]
			case 0xFF48: // h	[FULLWIDTH LATIN SMALL LETTER H]
				outString += "h";
				break;
			case 0x1F6: // ?	http;//en.wikipedia.org/wiki/Hwair	[LATIN CAPITAL LETTER HWAIR]
				outString += "H";
				outString += "V";
				break;
			case 0x24A3: // ?	[PARENTHESIZED LATIN SMALL LETTER H]
				outString += "(";
				outString += "h";
				outString += ")";
				break;
			case 0x195: // ?	[LATIN SMALL LETTER HV]
				outString += "h";
				outString += "v";
				break;
			case 0xCC: // Ì	[LATIN CAPITAL LETTER I WITH GRAVE]
			case 0xCD: // Í	[LATIN CAPITAL LETTER I WITH ACUTE]
			case 0xCE: // Î	[LATIN CAPITAL LETTER I WITH CIRCUMFLEX]
			case 0xCF: // Ï	[LATIN CAPITAL LETTER I WITH DIAERESIS]
			case 0x128: // I	[LATIN CAPITAL LETTER I WITH TILDE]
			case 0x12A: // I	[LATIN CAPITAL LETTER I WITH MACRON]
			case 0x12C: // I	[LATIN CAPITAL LETTER I WITH BREVE]
			case 0x12E: // I	[LATIN CAPITAL LETTER I WITH OGONEK]
			case 0x130: // I	[LATIN CAPITAL LETTER I WITH DOT ABOVE]
			case 0x196: // ?	[LATIN CAPITAL LETTER IOTA]
			case 0x197: // I	[LATIN CAPITAL LETTER I WITH STROKE]
			case 0x1CF: // I	[LATIN CAPITAL LETTER I WITH CARON]
			case 0x208: // ?	[LATIN CAPITAL LETTER I WITH DOUBLE GRAVE]
			case 0x20A: // ?	[LATIN CAPITAL LETTER I WITH INVERTED BREVE]
			case 0x26A: // ?	[LATIN LETTER SMALL CAPITAL I]
			case 0x1D7B: // ?	[LATIN SMALL CAPITAL LETTER I WITH STROKE]
			case 0x1E2C: // ?	[LATIN CAPITAL LETTER I WITH TILDE BELOW]
			case 0x1E2E: // ?	[LATIN CAPITAL LETTER I WITH DIAERESIS AND ACUTE]
			case 0x1EC8: // ?	[LATIN CAPITAL LETTER I WITH HOOK ABOVE]
			case 0x1ECA: // ?	[LATIN CAPITAL LETTER I WITH DOT BELOW]
			case 0x24BE: // ?	[CIRCLED LATIN CAPITAL LETTER I]
			case 0xA7FE: // ?	[LATIN EPIGRAPHIC LETTER I LONGA]
			case 0xFF29: // I	[FULLWIDTH LATIN CAPITAL LETTER I]
				outString += "I";
				break;
			case 0xEC: // ì	[LATIN SMALL LETTER I WITH GRAVE]
			case 0xED: // í	[LATIN SMALL LETTER I WITH ACUTE]
			case 0xEE: // î	[LATIN SMALL LETTER I WITH CIRCUMFLEX]
			case 0xEF: // ï	[LATIN SMALL LETTER I WITH DIAERESIS]
			case 0x129: // i	[LATIN SMALL LETTER I WITH TILDE]
			case 0x12B: // i	[LATIN SMALL LETTER I WITH MACRON]
			case 0x12D: // i	[LATIN SMALL LETTER I WITH BREVE]
			case 0x12F: // i	[LATIN SMALL LETTER I WITH OGONEK]
			case 0x131: // i	[LATIN SMALL LETTER DOTLESS I]
			case 0x1D0: // i	[LATIN SMALL LETTER I WITH CARON]
			case 0x209: // ?	[LATIN SMALL LETTER I WITH DOUBLE GRAVE]
			case 0x20B: // ?	[LATIN SMALL LETTER I WITH INVERTED BREVE]
			case 0x268: // ?	[LATIN SMALL LETTER I WITH STROKE]
			case 0x1D09: // ?	[LATIN SMALL LETTER TURNED I]
			case 0x1D62: // ?	[LATIN SUBSCRIPT SMALL LETTER I]
			case 0x1D7C: // ?	[LATIN SMALL LETTER IOTA WITH STROKE]
			case 0x1D96: // ?	[LATIN SMALL LETTER I WITH RETROFLEX HOOK]
			case 0x1E2D: // ?	[LATIN SMALL LETTER I WITH TILDE BELOW]
			case 0x1E2F: // ?	[LATIN SMALL LETTER I WITH DIAERESIS AND ACUTE]
			case 0x1EC9: // ?	[LATIN SMALL LETTER I WITH HOOK ABOVE]
			case 0x1ECB: // ?	[LATIN SMALL LETTER I WITH DOT BELOW]
			case 0x2071: // ?	[SUPERSCRIPT LATIN SMALL LETTER I]
			case 0x24D8: // ?	[CIRCLED LATIN SMALL LETTER I]
			case 0xFF49: // i	[FULLWIDTH LATIN SMALL LETTER I]
				outString += "i";
				break;
			case 0x132: // ?	[LATIN CAPITAL LIGATURE IJ]
				outString += "I";
				outString += "J";
				break;
			case 0x24A4: // ?	[PARENTHESIZED LATIN SMALL LETTER I]
				outString += "(";
				outString += "i";
				outString += ")";
				break;
			case 0x133: // ?	[LATIN SMALL LIGATURE IJ]
				outString += "i";
				outString += "j";
				break;
			case 0x134: // J	[LATIN CAPITAL LETTER J WITH CIRCUMFLEX]
			case 0x248: // ?	[LATIN CAPITAL LETTER J WITH STROKE]
			case 0x1D0A: // ?	[LATIN LETTER SMALL CAPITAL J]
			case 0x24BF: // ?	[CIRCLED LATIN CAPITAL LETTER J]
			case 0xFF2A: // J	[FULLWIDTH LATIN CAPITAL LETTER J]
				outString += "J";
				break;
			case 0x135: // j	[LATIN SMALL LETTER J WITH CIRCUMFLEX]
			case 0x1F0: // j	[LATIN SMALL LETTER J WITH CARON]
			case 0x237: // ?	[LATIN SMALL LETTER DOTLESS J]
			case 0x249: // ?	[LATIN SMALL LETTER J WITH STROKE]
			case 0x25F: // ?	[LATIN SMALL LETTER DOTLESS J WITH STROKE]
			case 0x284: // ?	[LATIN SMALL LETTER DOTLESS J WITH STROKE AND HOOK]
			case 0x29D: // ?	[LATIN SMALL LETTER J WITH CROSSED-TAIL]
			case 0x24D9: // ?	[CIRCLED LATIN SMALL LETTER J]
			case 0x2C7C: // ?	[LATIN SUBSCRIPT SMALL LETTER J]
			case 0xFF4A: // j	[FULLWIDTH LATIN SMALL LETTER J]
				outString += "j";
				break;
			case 0x24A5: // ?	[PARENTHESIZED LATIN SMALL LETTER J]
				outString += "(";
				outString += "j";
				outString += ")";
				break;
			case 0x136: // K	[LATIN CAPITAL LETTER K WITH CEDILLA]
			case 0x198: // ?	[LATIN CAPITAL LETTER K WITH HOOK]
			case 0x1E8: // K	[LATIN CAPITAL LETTER K WITH CARON]
			case 0x1D0B: // ?	[LATIN LETTER SMALL CAPITAL K]
			case 0x1E30: // ?	[LATIN CAPITAL LETTER K WITH ACUTE]
			case 0x1E32: // ?	[LATIN CAPITAL LETTER K WITH DOT BELOW]
			case 0x1E34: // ?	[LATIN CAPITAL LETTER K WITH LINE BELOW]
			case 0x24C0: // ?	[CIRCLED LATIN CAPITAL LETTER K]
			case 0x2C69: // ?	[LATIN CAPITAL LETTER K WITH DESCENDER]
			case 0xA740: // ?	[LATIN CAPITAL LETTER K WITH STROKE]
			case 0xA742: // ?	[LATIN CAPITAL LETTER K WITH DIAGONAL STROKE]
			case 0xA744: // ?	[LATIN CAPITAL LETTER K WITH STROKE AND DIAGONAL STROKE]
			case 0xFF2B: // K	[FULLWIDTH LATIN CAPITAL LETTER K]
				outString += "K";
				break;
			case 0x137: // k	[LATIN SMALL LETTER K WITH CEDILLA]
			case 0x199: // ?	[LATIN SMALL LETTER K WITH HOOK]
			case 0x1E9: // k	[LATIN SMALL LETTER K WITH CARON]
			case 0x29E: // ?	[LATIN SMALL LETTER TURNED K]
			case 0x1D84: // ?	[LATIN SMALL LETTER K WITH PALATAL HOOK]
			case 0x1E31: // ?	[LATIN SMALL LETTER K WITH ACUTE]
			case 0x1E33: // ?	[LATIN SMALL LETTER K WITH DOT BELOW]
			case 0x1E35: // ?	[LATIN SMALL LETTER K WITH LINE BELOW]
			case 0x24DA: // ?	[CIRCLED LATIN SMALL LETTER K]
			case 0x2C6A: // ?	[LATIN SMALL LETTER K WITH DESCENDER]
			case 0xA741: // ?	[LATIN SMALL LETTER K WITH STROKE]
			case 0xA743: // ?	[LATIN SMALL LETTER K WITH DIAGONAL STROKE]
			case 0xA745: // ?	[LATIN SMALL LETTER K WITH STROKE AND DIAGONAL STROKE]
			case 0xFF4B: // k	[FULLWIDTH LATIN SMALL LETTER K]
				outString += "k";
				break;
			case 0x24A6: // ?	[PARENTHESIZED LATIN SMALL LETTER K]
				outString += "(";
				outString += "k";
				outString += ")";
				break;
			case 0x139: // L	[LATIN CAPITAL LETTER L WITH ACUTE]
			case 0x13B: // L	[LATIN CAPITAL LETTER L WITH CEDILLA]
			case 0x13D: // L	[LATIN CAPITAL LETTER L WITH CARON]
			case 0x13F: // ?	[LATIN CAPITAL LETTER L WITH MIDDLE DOT]
			case 0x141: // L	[LATIN CAPITAL LETTER L WITH STROKE]
			case 0x23D: // ?	[LATIN CAPITAL LETTER L WITH BAR]
			case 0x29F: // ?	[LATIN LETTER SMALL CAPITAL L]
			case 0x1D0C: // ?	[LATIN LETTER SMALL CAPITAL L WITH STROKE]
			case 0x1E36: // ?	[LATIN CAPITAL LETTER L WITH DOT BELOW]
			case 0x1E38: // ?	[LATIN CAPITAL LETTER L WITH DOT BELOW AND MACRON]
			case 0x1E3A: // ?	[LATIN CAPITAL LETTER L WITH LINE BELOW]
			case 0x1E3C: // ?	[LATIN CAPITAL LETTER L WITH CIRCUMFLEX BELOW]
			case 0x24C1: // ?	[CIRCLED LATIN CAPITAL LETTER L]
			case 0x2C60: // ?	[LATIN CAPITAL LETTER L WITH DOUBLE BAR]
			case 0x2C62: // ?	[LATIN CAPITAL LETTER L WITH MIDDLE TILDE]
			case 0xA746: // ?	[LATIN CAPITAL LETTER BROKEN L]
			case 0xA748: // ?	[LATIN CAPITAL LETTER L WITH HIGH STROKE]
			case 0xA780: // ?	[LATIN CAPITAL LETTER TURNED L]
			case 0xFF2C: // L	[FULLWIDTH LATIN CAPITAL LETTER L]
				outString += "L";
				break;
			case 0x13A: // l	[LATIN SMALL LETTER L WITH ACUTE]
			case 0x13C: // l	[LATIN SMALL LETTER L WITH CEDILLA]
			case 0x13E: // l	[LATIN SMALL LETTER L WITH CARON]
			case 0x140: // ?	[LATIN SMALL LETTER L WITH MIDDLE DOT]
			case 0x142: // l	[LATIN SMALL LETTER L WITH STROKE]
			case 0x19A: // l	[LATIN SMALL LETTER L WITH BAR]
			case 0x234: // ?	[LATIN SMALL LETTER L WITH CURL]
			case 0x26B: // ?	[LATIN SMALL LETTER L WITH MIDDLE TILDE]
			case 0x26C: // ?	[LATIN SMALL LETTER L WITH BELT]
			case 0x26D: // ?	[LATIN SMALL LETTER L WITH RETROFLEX HOOK]
			case 0x1D85: // ?	[LATIN SMALL LETTER L WITH PALATAL HOOK]
			case 0x1E37: // ?	[LATIN SMALL LETTER L WITH DOT BELOW]
			case 0x1E39: // ?	[LATIN SMALL LETTER L WITH DOT BELOW AND MACRON]
			case 0x1E3B: // ?	[LATIN SMALL LETTER L WITH LINE BELOW]
			case 0x1E3D: // ?	[LATIN SMALL LETTER L WITH CIRCUMFLEX BELOW]
			case 0x24DB: // ?	[CIRCLED LATIN SMALL LETTER L]
			case 0x2C61: // ?	[LATIN SMALL LETTER L WITH DOUBLE BAR]
			case 0xA747: // ?	[LATIN SMALL LETTER BROKEN L]
			case 0xA749: // ?	[LATIN SMALL LETTER L WITH HIGH STROKE]
			case 0xA781: // ?	[LATIN SMALL LETTER TURNED L]
			case 0xFF4C: // l	[FULLWIDTH LATIN SMALL LETTER L]
				outString += "l";
				break;
			case 0x1C7: // ?	[LATIN CAPITAL LETTER LJ]
				outString += "L";
				outString += "J";
				break;
			case 0x1EFA: // ?	[LATIN CAPITAL LETTER MIDDLE-WELSH LL]
				outString += "L";
				outString += "L";
				break;
			case 0x1C8: // ?	[LATIN CAPITAL LETTER L WITH SMALL LETTER J]
				outString += "L";
				outString += "j";
				break;
			case 0x24A7: // ?	[PARENTHESIZED LATIN SMALL LETTER L]
				outString += "(";
				outString += "l";
				outString += ")";
				break;
			case 0x1C9: // ?	[LATIN SMALL LETTER LJ]
				outString += "l";
				outString += "j";
				break;
			case 0x1EFB: // ?	[LATIN SMALL LETTER MIDDLE-WELSH LL]
				outString += "l";
				outString += "l";
				break;
			case 0x2AA: // ?	[LATIN SMALL LETTER LS DIGRAPH]
				outString += "l";
				outString += "s";
				break;
			case 0x2AB: // ?	[LATIN SMALL LETTER LZ DIGRAPH]
				outString += "l";
				outString += "z";
				break;
			case 0x19C: // ?	[LATIN CAPITAL LETTER TURNED M]
			case 0x1D0D: // ?	[LATIN LETTER SMALL CAPITAL M]
			case 0x1E3E: // ?	[LATIN CAPITAL LETTER M WITH ACUTE]
			case 0x1E40: // ?	[LATIN CAPITAL LETTER M WITH DOT ABOVE]
			case 0x1E42: // ?	[LATIN CAPITAL LETTER M WITH DOT BELOW]
			case 0x24C2: // ?	[CIRCLED LATIN CAPITAL LETTER M]
			case 0x2C6E: // ?	[LATIN CAPITAL LETTER M WITH HOOK]
			case 0xA7FD: // ?	[LATIN EPIGRAPHIC LETTER INVERTED M]
			case 0xA7FF: // ?	[LATIN EPIGRAPHIC LETTER ARCHAIC M]
			case 0xFF2D: // M	[FULLWIDTH LATIN CAPITAL LETTER M]
				outString += "M";
				break;
			case 0x26F: // ?	[LATIN SMALL LETTER TURNED M]
			case 0x270: // ?	[LATIN SMALL LETTER TURNED M WITH LONG LEG]
			case 0x271: // ?	[LATIN SMALL LETTER M WITH HOOK]
			case 0x1D6F: // ?	[LATIN SMALL LETTER M WITH MIDDLE TILDE]
			case 0x1D86: // ?	[LATIN SMALL LETTER M WITH PALATAL HOOK]
			case 0x1E3F: // ?	[LATIN SMALL LETTER M WITH ACUTE]
			case 0x1E41: // ?	[LATIN SMALL LETTER M WITH DOT ABOVE]
			case 0x1E43: // ?	[LATIN SMALL LETTER M WITH DOT BELOW]
			case 0x24DC: // ?	[CIRCLED LATIN SMALL LETTER M]
			case 0xFF4D: // m	[FULLWIDTH LATIN SMALL LETTER M]
				outString += "m";
				break;
			case 0x24A8: // ?	[PARENTHESIZED LATIN SMALL LETTER M]
				outString += "(";
				outString += "m";
				outString += ")";
				break;
			case 0xD1: // Ñ	[LATIN CAPITAL LETTER N WITH TILDE]
			case 0x143: // N	[LATIN CAPITAL LETTER N WITH ACUTE]
			case 0x145: // N	[LATIN CAPITAL LETTER N WITH CEDILLA]
			case 0x147: // N	[LATIN CAPITAL LETTER N WITH CARON]
			case 0x14A: // ?	http;//en.wikipedia.org/wiki/Eng_(letter)	[LATIN CAPITAL LETTER ENG]
			case 0x19D: // ?	[LATIN CAPITAL LETTER N WITH LEFT HOOK]
			case 0x1F8: // ?	[LATIN CAPITAL LETTER N WITH GRAVE]
			case 0x220: // ?	[LATIN CAPITAL LETTER N WITH LONG RIGHT LEG]
			case 0x274: // ?	[LATIN LETTER SMALL CAPITAL N]
			case 0x1D0E: // ?	[LATIN LETTER SMALL CAPITAL REVERSED N]
			case 0x1E44: // ?	[LATIN CAPITAL LETTER N WITH DOT ABOVE]
			case 0x1E46: // ?	[LATIN CAPITAL LETTER N WITH DOT BELOW]
			case 0x1E48: // ?	[LATIN CAPITAL LETTER N WITH LINE BELOW]
			case 0x1E4A: // ?	[LATIN CAPITAL LETTER N WITH CIRCUMFLEX BELOW]
			case 0x24C3: // ?	[CIRCLED LATIN CAPITAL LETTER N]
			case 0xFF2E: // N	[FULLWIDTH LATIN CAPITAL LETTER N]
				outString += "N";
				break;
			case 0xF1: // ñ	[LATIN SMALL LETTER N WITH TILDE]
			case 0x144: // n	[LATIN SMALL LETTER N WITH ACUTE]
			case 0x146: // n	[LATIN SMALL LETTER N WITH CEDILLA]
			case 0x148: // n	[LATIN SMALL LETTER N WITH CARON]
			case 0x149: // ?	[LATIN SMALL LETTER N PRECEDED BY APOSTROPHE]
			case 0x14B: // ?	http;//en.wikipedia.org/wiki/Eng_(letter)	[LATIN SMALL LETTER ENG]
			case 0x19E: // ?	[LATIN SMALL LETTER N WITH LONG RIGHT LEG]
			case 0x1F9: // ?	[LATIN SMALL LETTER N WITH GRAVE]
			case 0x235: // ?	[LATIN SMALL LETTER N WITH CURL]
			case 0x272: // ?	[LATIN SMALL LETTER N WITH LEFT HOOK]
			case 0x273: // ?	[LATIN SMALL LETTER N WITH RETROFLEX HOOK]
			case 0x1D70: // ?	[LATIN SMALL LETTER N WITH MIDDLE TILDE]
			case 0x1D87: // ?	[LATIN SMALL LETTER N WITH PALATAL HOOK]
			case 0x1E45: // ?	[LATIN SMALL LETTER N WITH DOT ABOVE]
			case 0x1E47: // ?	[LATIN SMALL LETTER N WITH DOT BELOW]
			case 0x1E49: // ?	[LATIN SMALL LETTER N WITH LINE BELOW]
			case 0x1E4B: // ?	[LATIN SMALL LETTER N WITH CIRCUMFLEX BELOW]
			case 0x207F: // n	[SUPERSCRIPT LATIN SMALL LETTER N]
			case 0x24DD: // ?	[CIRCLED LATIN SMALL LETTER N]
			case 0xFF4E: // n	[FULLWIDTH LATIN SMALL LETTER N]
				outString += "n";
				break;
			case 0x1CA: // ?	[LATIN CAPITAL LETTER NJ]
				outString += "N";
				outString += "J";
				break;
			case 0x1CB: // ?	[LATIN CAPITAL LETTER N WITH SMALL LETTER J]
				outString += "N";
				outString += "j";
				break;
			case 0x24A9: // ?	[PARENTHESIZED LATIN SMALL LETTER N]
				outString += "(";
				outString += "n";
				outString += ")";
				break;
			case 0x1CC: // ?	[LATIN SMALL LETTER NJ]
				outString += "n";
				outString += "j";
				break;
			case 0xD2: // Ò	[LATIN CAPITAL LETTER O WITH GRAVE]
			case 0xD3: // Ó	[LATIN CAPITAL LETTER O WITH ACUTE]
			case 0xD4: // Ô	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX]
			case 0xD5: // Õ	[LATIN CAPITAL LETTER O WITH TILDE]
			case 0xD6: // Ö	[LATIN CAPITAL LETTER O WITH DIAERESIS]
			case 0xD8: // Ø	[LATIN CAPITAL LETTER O WITH STROKE]
			case 0x14C: // O	[LATIN CAPITAL LETTER O WITH MACRON]
			case 0x14E: // O	[LATIN CAPITAL LETTER O WITH BREVE]
			case 0x150: // O	[LATIN CAPITAL LETTER O WITH DOUBLE ACUTE]
			case 0x186: // ?	[LATIN CAPITAL LETTER OPEN O]
			case 0x19F: // O	[LATIN CAPITAL LETTER O WITH MIDDLE TILDE]
			case 0x1A0: // O	[LATIN CAPITAL LETTER O WITH HORN]
			case 0x1D1: // O	[LATIN CAPITAL LETTER O WITH CARON]
			case 0x1EA: // O	[LATIN CAPITAL LETTER O WITH OGONEK]
			case 0x1EC: // O	[LATIN CAPITAL LETTER O WITH OGONEK AND MACRON]
			case 0x1FE: // ?	[LATIN CAPITAL LETTER O WITH STROKE AND ACUTE]
			case 0x20C: // ?	[LATIN CAPITAL LETTER O WITH DOUBLE GRAVE]
			case 0x20E: // ?	[LATIN CAPITAL LETTER O WITH INVERTED BREVE]
			case 0x22A: // ?	[LATIN CAPITAL LETTER O WITH DIAERESIS AND MACRON]
			case 0x22C: // ?	[LATIN CAPITAL LETTER O WITH TILDE AND MACRON]
			case 0x22E: // ?	[LATIN CAPITAL LETTER O WITH DOT ABOVE]
			case 0x230: // ?	[LATIN CAPITAL LETTER O WITH DOT ABOVE AND MACRON]
			case 0x1D0F: // ?	[LATIN LETTER SMALL CAPITAL O]
			case 0x1D10: // ?	[LATIN LETTER SMALL CAPITAL OPEN O]
			case 0x1E4C: // ?	[LATIN CAPITAL LETTER O WITH TILDE AND ACUTE]
			case 0x1E4E: // ?	[LATIN CAPITAL LETTER O WITH TILDE AND DIAERESIS]
			case 0x1E50: // ?	[LATIN CAPITAL LETTER O WITH MACRON AND GRAVE]
			case 0x1E52: // ?	[LATIN CAPITAL LETTER O WITH MACRON AND ACUTE]
			case 0x1ECC: // ?	[LATIN CAPITAL LETTER O WITH DOT BELOW]
			case 0x1ECE: // ?	[LATIN CAPITAL LETTER O WITH HOOK ABOVE]
			case 0x1ED0: // ?	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE]
			case 0x1ED2: // ?	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE]
			case 0x1ED4: // ?	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1ED6: // ?	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE]
			case 0x1ED8: // ?	[LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND DOT BELOW]
			case 0x1EDA: // ?	[LATIN CAPITAL LETTER O WITH HORN AND ACUTE]
			case 0x1EDC: // ?	[LATIN CAPITAL LETTER O WITH HORN AND GRAVE]
			case 0x1EDE: // ?	[LATIN CAPITAL LETTER O WITH HORN AND HOOK ABOVE]
			case 0x1EE0: // ?	[LATIN CAPITAL LETTER O WITH HORN AND TILDE]
			case 0x1EE2: // ?	[LATIN CAPITAL LETTER O WITH HORN AND DOT BELOW]
			case 0x24C4: // ?	[CIRCLED LATIN CAPITAL LETTER O]
			case 0xA74A: // ?	[LATIN CAPITAL LETTER O WITH LONG STROKE OVERLAY]
			case 0xA74C: // ?	[LATIN CAPITAL LETTER O WITH LOOP]
			case 0xFF2F: // O	[FULLWIDTH LATIN CAPITAL LETTER O]
				outString += "O";
				break;
			case 0xF2: // ò	[LATIN SMALL LETTER O WITH GRAVE]
			case 0xF3: // ó	[LATIN SMALL LETTER O WITH ACUTE]
			case 0xF4: // ô	[LATIN SMALL LETTER O WITH CIRCUMFLEX]
			case 0xF5: // õ	[LATIN SMALL LETTER O WITH TILDE]
			case 0xF6: // ö	[LATIN SMALL LETTER O WITH DIAERESIS]
			case 0xF8: // ø	[LATIN SMALL LETTER O WITH STROKE]
			case 0x14D: // o	[LATIN SMALL LETTER O WITH MACRON]
			case 0x14F: // o	[LATIN SMALL LETTER O WITH BREVE]
			case 0x151: // o	[LATIN SMALL LETTER O WITH DOUBLE ACUTE]
			case 0x1A1: // o	[LATIN SMALL LETTER O WITH HORN]
			case 0x1D2: // o	[LATIN SMALL LETTER O WITH CARON]
			case 0x1EB: // o	[LATIN SMALL LETTER O WITH OGONEK]
			case 0x1ED: // o	[LATIN SMALL LETTER O WITH OGONEK AND MACRON]
			case 0x1FF: // ?	[LATIN SMALL LETTER O WITH STROKE AND ACUTE]
			case 0x20D: // ?	[LATIN SMALL LETTER O WITH DOUBLE GRAVE]
			case 0x20F: // ?	[LATIN SMALL LETTER O WITH INVERTED BREVE]
			case 0x22B: // ?	[LATIN SMALL LETTER O WITH DIAERESIS AND MACRON]
			case 0x22D: // ?	[LATIN SMALL LETTER O WITH TILDE AND MACRON]
			case 0x22F: // ?	[LATIN SMALL LETTER O WITH DOT ABOVE]
			case 0x231: // ?	[LATIN SMALL LETTER O WITH DOT ABOVE AND MACRON]
			case 0x254: // ?	[LATIN SMALL LETTER OPEN O]
			case 0x275: // ?	[LATIN SMALL LETTER BARRED O]
			case 0x1D16: // ?	[LATIN SMALL LETTER TOP HALF O]
			case 0x1D17: // ?	[LATIN SMALL LETTER BOTTOM HALF O]
			case 0x1D97: // ?	[LATIN SMALL LETTER OPEN O WITH RETROFLEX HOOK]
			case 0x1E4D: // ?	[LATIN SMALL LETTER O WITH TILDE AND ACUTE]
			case 0x1E4F: // ?	[LATIN SMALL LETTER O WITH TILDE AND DIAERESIS]
			case 0x1E51: // ?	[LATIN SMALL LETTER O WITH MACRON AND GRAVE]
			case 0x1E53: // ?	[LATIN SMALL LETTER O WITH MACRON AND ACUTE]
			case 0x1ECD: // ?	[LATIN SMALL LETTER O WITH DOT BELOW]
			case 0x1ECF: // ?	[LATIN SMALL LETTER O WITH HOOK ABOVE]
			case 0x1ED1: // ?	[LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE]
			case 0x1ED3: // ?	[LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE]
			case 0x1ED5: // ?	[LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE]
			case 0x1ED7: // ?	[LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE]
			case 0x1ED9: // ?	[LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW]
			case 0x1EDB: // ?	[LATIN SMALL LETTER O WITH HORN AND ACUTE]
			case 0x1EDD: // ?	[LATIN SMALL LETTER O WITH HORN AND GRAVE]
			case 0x1EDF: // ?	[LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE]
			case 0x1EE1: // ?	[LATIN SMALL LETTER O WITH HORN AND TILDE]
			case 0x1EE3: // ?	[LATIN SMALL LETTER O WITH HORN AND DOT BELOW]
			case 0x2092: // ?	[LATIN SUBSCRIPT SMALL LETTER O]
			case 0x24DE: // ?	[CIRCLED LATIN SMALL LETTER O]
			case 0x2C7A: // ?	[LATIN SMALL LETTER O WITH LOW RING INSIDE]
			case 0xA74B: // ?	[LATIN SMALL LETTER O WITH LONG STROKE OVERLAY]
			case 0xA74D: // ?	[LATIN SMALL LETTER O WITH LOOP]
			case 0xFF4F: // o	[FULLWIDTH LATIN SMALL LETTER O]
				outString += "o";
				break;
			case 0x152: // Œ	[LATIN CAPITAL LIGATURE OE]
			case 0x276: // ?	[LATIN LETTER SMALL CAPITAL OE]
				outString += "O";
				outString += "E";
				break;
			case 0xA74E: // ?	[LATIN CAPITAL LETTER OO]
				outString += "O";
				outString += "O";
				break;
			case 0x222: // ?	http;//en.wikipedia.org/wiki/OU	[LATIN CAPITAL LETTER OU]
			case 0x1D15: // ?	[LATIN LETTER SMALL CAPITAL OU]
				outString += "O";
				outString += "U";
				break;
			case 0x24AA: // ?	[PARENTHESIZED LATIN SMALL LETTER O]
				outString += "(";
				outString += "o";
				outString += ")";
				break;
			case 0x153: // œ	[LATIN SMALL LIGATURE OE]
			case 0x1D14: // ?	[LATIN SMALL LETTER TURNED OE]
				outString += "o";
				outString += "e";
				break;
			case 0xA74F: // ?	[LATIN SMALL LETTER OO]
				outString += "o";
				outString += "o";
				break;
			case 0x223: // ?	http;//en.wikipedia.org/wiki/OU	[LATIN SMALL LETTER OU]
				outString += "o";
				outString += "u";
				break;
			case 0x1A4: // ?	[LATIN CAPITAL LETTER P WITH HOOK]
			case 0x1D18: // ?	[LATIN LETTER SMALL CAPITAL P]
			case 0x1E54: // ?	[LATIN CAPITAL LETTER P WITH ACUTE]
			case 0x1E56: // ?	[LATIN CAPITAL LETTER P WITH DOT ABOVE]
			case 0x24C5: // ?	[CIRCLED LATIN CAPITAL LETTER P]
			case 0x2C63: // ?	[LATIN CAPITAL LETTER P WITH STROKE]
			case 0xA750: // ?	[LATIN CAPITAL LETTER P WITH STROKE THROUGH DESCENDER]
			case 0xA752: // ?	[LATIN CAPITAL LETTER P WITH FLOURISH]
			case 0xA754: // ?	[LATIN CAPITAL LETTER P WITH SQUIRREL TAIL]
			case 0xFF30: // P	[FULLWIDTH LATIN CAPITAL LETTER P]
				outString += "P";
				break;
			case 0x1A5: // ?	[LATIN SMALL LETTER P WITH HOOK]
			case 0x1D71: // ?	[LATIN SMALL LETTER P WITH MIDDLE TILDE]
			case 0x1D7D: // ?	[LATIN SMALL LETTER P WITH STROKE]
			case 0x1D88: // ?	[LATIN SMALL LETTER P WITH PALATAL HOOK]
			case 0x1E55: // ?	[LATIN SMALL LETTER P WITH ACUTE]
			case 0x1E57: // ?	[LATIN SMALL LETTER P WITH DOT ABOVE]
			case 0x24DF: // ?	[CIRCLED LATIN SMALL LETTER P]
			case 0xA751: // ?	[LATIN SMALL LETTER P WITH STROKE THROUGH DESCENDER]
			case 0xA753: // ?	[LATIN SMALL LETTER P WITH FLOURISH]
			case 0xA755: // ?	[LATIN SMALL LETTER P WITH SQUIRREL TAIL]
			case 0xA7FC: // ?	[LATIN EPIGRAPHIC LETTER REVERSED P]
			case 0xFF50: // p	[FULLWIDTH LATIN SMALL LETTER P]
				outString += "p";
				break;
			case 0x24AB: // ?	[PARENTHESIZED LATIN SMALL LETTER P]
				outString += "(";
				outString += "p";
				outString += ")";
				break;
			case 0x24A: // ?	[LATIN CAPITAL LETTER SMALL Q WITH HOOK TAIL]
			case 0x24C6: // ?	[CIRCLED LATIN CAPITAL LETTER Q]
			case 0xA756: // ?	[LATIN CAPITAL LETTER Q WITH STROKE THROUGH DESCENDER]
			case 0xA758: // ?	[LATIN CAPITAL LETTER Q WITH DIAGONAL STROKE]
			case 0xFF31: // Q	[FULLWIDTH LATIN CAPITAL LETTER Q]
				outString += "Q";
				break;
			case 0x138: // ?	http;//en.wikipedia.org/wiki/Kra_(letter)	[LATIN SMALL LETTER KRA]
			case 0x24B: // ?	[LATIN SMALL LETTER Q WITH HOOK TAIL]
			case 0x2A0: // ?	[LATIN SMALL LETTER Q WITH HOOK]
			case 0x24E0: // ?	[CIRCLED LATIN SMALL LETTER Q]
			case 0xA757: // ?	[LATIN SMALL LETTER Q WITH STROKE THROUGH DESCENDER]
			case 0xA759: // ?	[LATIN SMALL LETTER Q WITH DIAGONAL STROKE]
			case 0xFF51: // q	[FULLWIDTH LATIN SMALL LETTER Q]
				outString += "q";
				break;
			case 0x24AC: // ?	[PARENTHESIZED LATIN SMALL LETTER Q]
				outString += "(";
				outString += "q";
				outString += ")";
				break;
			case 0x239: // ?	[LATIN SMALL LETTER QP DIGRAPH]
				outString += "q";
				outString += "p";
				break;
			case 0x154: // R	[LATIN CAPITAL LETTER R WITH ACUTE]
			case 0x156: // R	[LATIN CAPITAL LETTER R WITH CEDILLA]
			case 0x158: // R	[LATIN CAPITAL LETTER R WITH CARON]
			case 0x210: // ?	[LATIN CAPITAL LETTER R WITH DOUBLE GRAVE]
			case 0x212: // ?	[LATIN CAPITAL LETTER R WITH INVERTED BREVE]
			case 0x24C: // ?	[LATIN CAPITAL LETTER R WITH STROKE]
			case 0x280: // ?	[LATIN LETTER SMALL CAPITAL R]
			case 0x281: // ?	[LATIN LETTER SMALL CAPITAL INVERTED R]
			case 0x1D19: // ?	[LATIN LETTER SMALL CAPITAL REVERSED R]
			case 0x1D1A: // ?	[LATIN LETTER SMALL CAPITAL TURNED R]
			case 0x1E58: // ?	[LATIN CAPITAL LETTER R WITH DOT ABOVE]
			case 0x1E5A: // ?	[LATIN CAPITAL LETTER R WITH DOT BELOW]
			case 0x1E5C: // ?	[LATIN CAPITAL LETTER R WITH DOT BELOW AND MACRON]
			case 0x1E5E: // ?	[LATIN CAPITAL LETTER R WITH LINE BELOW]
			case 0x24C7: // ?	[CIRCLED LATIN CAPITAL LETTER R]
			case 0x2C64: // ?	[LATIN CAPITAL LETTER R WITH TAIL]
			case 0xA75A: // ?	[LATIN CAPITAL LETTER R ROTUNDA]
			case 0xA782: // ?	[LATIN CAPITAL LETTER INSULAR R]
			case 0xFF32: // R	[FULLWIDTH LATIN CAPITAL LETTER R]
				outString += "R";
				break;
			case 0x155: // r	[LATIN SMALL LETTER R WITH ACUTE]
			case 0x157: // r	[LATIN SMALL LETTER R WITH CEDILLA]
			case 0x159: // r	[LATIN SMALL LETTER R WITH CARON]
			case 0x211: // ?	[LATIN SMALL LETTER R WITH DOUBLE GRAVE]
			case 0x213: // ?	[LATIN SMALL LETTER R WITH INVERTED BREVE]
			case 0x24D: // ?	[LATIN SMALL LETTER R WITH STROKE]
			case 0x27C: // ?	[LATIN SMALL LETTER R WITH LONG LEG]
			case 0x27D: // ?	[LATIN SMALL LETTER R WITH TAIL]
			case 0x27E: // ?	[LATIN SMALL LETTER R WITH FISHHOOK]
			case 0x27F: // ?	[LATIN SMALL LETTER REVERSED R WITH FISHHOOK]
			case 0x1D63: // ?	[LATIN SUBSCRIPT SMALL LETTER R]
			case 0x1D72: // ?	[LATIN SMALL LETTER R WITH MIDDLE TILDE]
			case 0x1D73: // ?	[LATIN SMALL LETTER R WITH FISHHOOK AND MIDDLE TILDE]
			case 0x1D89: // ?	[LATIN SMALL LETTER R WITH PALATAL HOOK]
			case 0x1E59: // ?	[LATIN SMALL LETTER R WITH DOT ABOVE]
			case 0x1E5B: // ?	[LATIN SMALL LETTER R WITH DOT BELOW]
			case 0x1E5D: // ?	[LATIN SMALL LETTER R WITH DOT BELOW AND MACRON]
			case 0x1E5F: // ?	[LATIN SMALL LETTER R WITH LINE BELOW]
			case 0x24E1: // ?	[CIRCLED LATIN SMALL LETTER R]
			case 0xA75B: // ?	[LATIN SMALL LETTER R ROTUNDA]
			case 0xA783: // ?	[LATIN SMALL LETTER INSULAR R]
			case 0xFF52: // r	[FULLWIDTH LATIN SMALL LETTER R]
				outString += "r";
				break;
			case 0x24AD: // ?	[PARENTHESIZED LATIN SMALL LETTER R]
				outString += "(";
				outString += "r";
				outString += ")";
				break;
			case 0x15A: // S	[LATIN CAPITAL LETTER S WITH ACUTE]
			case 0x15C: // S	[LATIN CAPITAL LETTER S WITH CIRCUMFLEX]
			case 0x15E: // S	[LATIN CAPITAL LETTER S WITH CEDILLA]
			case 0x160: // Š	[LATIN CAPITAL LETTER S WITH CARON]
			case 0x218: // ?	[LATIN CAPITAL LETTER S WITH COMMA BELOW]
			case 0x1E60: // ?	[LATIN CAPITAL LETTER S WITH DOT ABOVE]
			case 0x1E62: // ?	[LATIN CAPITAL LETTER S WITH DOT BELOW]
			case 0x1E64: // ?	[LATIN CAPITAL LETTER S WITH ACUTE AND DOT ABOVE]
			case 0x1E66: // ?	[LATIN CAPITAL LETTER S WITH CARON AND DOT ABOVE]
			case 0x1E68: // ?	[LATIN CAPITAL LETTER S WITH DOT BELOW AND DOT ABOVE]
			case 0x24C8: // ?	[CIRCLED LATIN CAPITAL LETTER S]
			case 0xA731: // ?	[LATIN LETTER SMALL CAPITAL S]
			case 0xA785: // ?	[LATIN SMALL LETTER INSULAR S]
			case 0xFF33: // S	[FULLWIDTH LATIN CAPITAL LETTER S]
				outString += "S";
				break;
			case 0x15B: // s	[LATIN SMALL LETTER S WITH ACUTE]
			case 0x15D: // s	[LATIN SMALL LETTER S WITH CIRCUMFLEX]
			case 0x15F: // s	[LATIN SMALL LETTER S WITH CEDILLA]
			case 0x161: // š	[LATIN SMALL LETTER S WITH CARON]
			case 0x17F: // ?	http;//en.wikipedia.org/wiki/Long_S	[LATIN SMALL LETTER LONG S]
			case 0x219: // ?	[LATIN SMALL LETTER S WITH COMMA BELOW]
			case 0x23F: // ?	[LATIN SMALL LETTER S WITH SWASH TAIL]
			case 0x282: // ?	[LATIN SMALL LETTER S WITH HOOK]
			case 0x1D74: // ?	[LATIN SMALL LETTER S WITH MIDDLE TILDE]
			case 0x1D8A: // ?	[LATIN SMALL LETTER S WITH PALATAL HOOK]
			case 0x1E61: // ?	[LATIN SMALL LETTER S WITH DOT ABOVE]
			case 0x1E63: // ?	[LATIN SMALL LETTER S WITH DOT BELOW]
			case 0x1E65: // ?	[LATIN SMALL LETTER S WITH ACUTE AND DOT ABOVE]
			case 0x1E67: // ?	[LATIN SMALL LETTER S WITH CARON AND DOT ABOVE]
			case 0x1E69: // ?	[LATIN SMALL LETTER S WITH DOT BELOW AND DOT ABOVE]
			case 0x1E9C: // ?	[LATIN SMALL LETTER LONG S WITH DIAGONAL STROKE]
			case 0x1E9D: // ?	[LATIN SMALL LETTER LONG S WITH HIGH STROKE]
			case 0x24E2: // ?	[CIRCLED LATIN SMALL LETTER S]
			case 0xA784: // ?	[LATIN CAPITAL LETTER INSULAR S]
			case 0xFF53: // s	[FULLWIDTH LATIN SMALL LETTER S]
				outString += "s";
				break;
			case 0x1E9E: // ?	[LATIN CAPITAL LETTER SHARP S]
				outString += "S";
				outString += "S";
				break;
			case 0x24AE: // ?	[PARENTHESIZED LATIN SMALL LETTER S]
				outString += "(";
				outString += "s";
				outString += ")";
				break;
			case 0xDF: // ß	[LATIN SMALL LETTER SHARP S]
				outString += "s";
				outString += "s";
				break;
			case 0xFB06: // ?	[LATIN SMALL LIGATURE ST]
				outString += "s";
				outString += "t";
				break;
			case 0x162: // T	[LATIN CAPITAL LETTER T WITH CEDILLA]
			case 0x164: // T	[LATIN CAPITAL LETTER T WITH CARON]
			case 0x166: // T	[LATIN CAPITAL LETTER T WITH STROKE]
			case 0x1AC: // ?	[LATIN CAPITAL LETTER T WITH HOOK]
			case 0x1AE: // T	[LATIN CAPITAL LETTER T WITH RETROFLEX HOOK]
			case 0x21A: // ?	[LATIN CAPITAL LETTER T WITH COMMA BELOW]
			case 0x23E: // ?	[LATIN CAPITAL LETTER T WITH DIAGONAL STROKE]
			case 0x1D1B: // ?	[LATIN LETTER SMALL CAPITAL T]
			case 0x1E6A: // ?	[LATIN CAPITAL LETTER T WITH DOT ABOVE]
			case 0x1E6C: // ?	[LATIN CAPITAL LETTER T WITH DOT BELOW]
			case 0x1E6E: // ?	[LATIN CAPITAL LETTER T WITH LINE BELOW]
			case 0x1E70: // ?	[LATIN CAPITAL LETTER T WITH CIRCUMFLEX BELOW]
			case 0x24C9: // ?	[CIRCLED LATIN CAPITAL LETTER T]
			case 0xA786: // ?	[LATIN CAPITAL LETTER INSULAR T]
			case 0xFF34: // T	[FULLWIDTH LATIN CAPITAL LETTER T]
				outString += "T";
				break;
			case 0x163: // t	[LATIN SMALL LETTER T WITH CEDILLA]
			case 0x165: // t	[LATIN SMALL LETTER T WITH CARON]
			case 0x167: // t	[LATIN SMALL LETTER T WITH STROKE]
			case 0x1AB: // t	[LATIN SMALL LETTER T WITH PALATAL HOOK]
			case 0x1AD: // ?	[LATIN SMALL LETTER T WITH HOOK]
			case 0x21B: // ?	[LATIN SMALL LETTER T WITH COMMA BELOW]
			case 0x236: // ?	[LATIN SMALL LETTER T WITH CURL]
			case 0x287: // ?	[LATIN SMALL LETTER TURNED T]
			case 0x288: // ?	[LATIN SMALL LETTER T WITH RETROFLEX HOOK]
			case 0x1D75: // ?	[LATIN SMALL LETTER T WITH MIDDLE TILDE]
			case 0x1E6B: // ?	[LATIN SMALL LETTER T WITH DOT ABOVE]
			case 0x1E6D: // ?	[LATIN SMALL LETTER T WITH DOT BELOW]
			case 0x1E6F: // ?	[LATIN SMALL LETTER T WITH LINE BELOW]
			case 0x1E71: // ?	[LATIN SMALL LETTER T WITH CIRCUMFLEX BELOW]
			case 0x1E97: // ?	[LATIN SMALL LETTER T WITH DIAERESIS]
			case 0x24E3: // ?	[CIRCLED LATIN SMALL LETTER T]
			case 0x2C66: // ?	[LATIN SMALL LETTER T WITH DIAGONAL STROKE]
			case 0xFF54: // t	[FULLWIDTH LATIN SMALL LETTER T]
				outString += "t";
				break;
			case 0xDE: // Þ	[LATIN CAPITAL LETTER THORN]
			case 0xA766: // ?	[LATIN CAPITAL LETTER THORN WITH STROKE THROUGH DESCENDER]
				outString += "T";
				outString += "H";
				break;
			case 0xA728: // ?	[LATIN CAPITAL LETTER TZ]
				outString += "T";
				outString += "Z";
				break;
			case 0x24AF: // ?	[PARENTHESIZED LATIN SMALL LETTER T]
				outString += "(";
				outString += "t";
				outString += ")";
				break;
			case 0x2A8: // ?	[LATIN SMALL LETTER TC DIGRAPH WITH CURL]
				outString += "t";
				outString += "c";
				break;
			case 0xFE: // þ	[LATIN SMALL LETTER THORN]
			case 0x1D7A: // ?	[LATIN SMALL LETTER TH WITH STRIKETHROUGH]
			case 0xA767: // ?	[LATIN SMALL LETTER THORN WITH STROKE THROUGH DESCENDER]
				outString += "t";
				outString += "h";
				break;
			case 0x2A6: // ?	[LATIN SMALL LETTER TS DIGRAPH]
				outString += "t";
				outString += "s";
				break;
			case 0xA729: // ?	[LATIN SMALL LETTER TZ]
				outString += "t";
				outString += "z";
				break;
			case 0xD9: // Ù	[LATIN CAPITAL LETTER U WITH GRAVE]
			case 0xDA: // Ú	[LATIN CAPITAL LETTER U WITH ACUTE]
			case 0xDB: // Û	[LATIN CAPITAL LETTER U WITH CIRCUMFLEX]
			case 0xDC: // Ü	[LATIN CAPITAL LETTER U WITH DIAERESIS]
			case 0x168: // U	[LATIN CAPITAL LETTER U WITH TILDE]
			case 0x16A: // U	[LATIN CAPITAL LETTER U WITH MACRON]
			case 0x16C: // U	[LATIN CAPITAL LETTER U WITH BREVE]
			case 0x16E: // U	[LATIN CAPITAL LETTER U WITH RING ABOVE]
			case 0x170: // U	[LATIN CAPITAL LETTER U WITH DOUBLE ACUTE]
			case 0x172: // U	[LATIN CAPITAL LETTER U WITH OGONEK]
			case 0x1AF: // U	[LATIN CAPITAL LETTER U WITH HORN]
			case 0x1D3: // U	[LATIN CAPITAL LETTER U WITH CARON]
			case 0x1D5: // U	[LATIN CAPITAL LETTER U WITH DIAERESIS AND MACRON]
			case 0x1D7: // U	[LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE]
			case 0x1D9: // U	[LATIN CAPITAL LETTER U WITH DIAERESIS AND CARON]
			case 0x1DB: // U	[LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE]
			case 0x214: // ?	[LATIN CAPITAL LETTER U WITH DOUBLE GRAVE]
			case 0x216: // ?	[LATIN CAPITAL LETTER U WITH INVERTED BREVE]
			case 0x244: // ?	[LATIN CAPITAL LETTER U BAR]
			case 0x1D1C: // ?	[LATIN LETTER SMALL CAPITAL U]
			case 0x1D7E: // ?	[LATIN SMALL CAPITAL LETTER U WITH STROKE]
			case 0x1E72: // ?	[LATIN CAPITAL LETTER U WITH DIAERESIS BELOW]
			case 0x1E74: // ?	[LATIN CAPITAL LETTER U WITH TILDE BELOW]
			case 0x1E76: // ?	[LATIN CAPITAL LETTER U WITH CIRCUMFLEX BELOW]
			case 0x1E78: // ?	[LATIN CAPITAL LETTER U WITH TILDE AND ACUTE]
			case 0x1E7A: // ?	[LATIN CAPITAL LETTER U WITH MACRON AND DIAERESIS]
			case 0x1EE4: // ?	[LATIN CAPITAL LETTER U WITH DOT BELOW]
			case 0x1EE6: // ?	[LATIN CAPITAL LETTER U WITH HOOK ABOVE]
			case 0x1EE8: // ?	[LATIN CAPITAL LETTER U WITH HORN AND ACUTE]
			case 0x1EEA: // ?	[LATIN CAPITAL LETTER U WITH HORN AND GRAVE]
			case 0x1EEC: // ?	[LATIN CAPITAL LETTER U WITH HORN AND HOOK ABOVE]
			case 0x1EEE: // ?	[LATIN CAPITAL LETTER U WITH HORN AND TILDE]
			case 0x1EF0: // ?	[LATIN CAPITAL LETTER U WITH HORN AND DOT BELOW]
			case 0x24CA: // ?	[CIRCLED LATIN CAPITAL LETTER U]
			case 0xFF35: // U	[FULLWIDTH LATIN CAPITAL LETTER U]
				outString += "U";
				break;
			case 0xF9: // ù	[LATIN SMALL LETTER U WITH GRAVE]
			case 0xFA: // ú	[LATIN SMALL LETTER U WITH ACUTE]
			case 0xFB: // û	[LATIN SMALL LETTER U WITH CIRCUMFLEX]
			case 0xFC: // ü	[LATIN SMALL LETTER U WITH DIAERESIS]
			case 0x169: // u	[LATIN SMALL LETTER U WITH TILDE]
			case 0x16B: // u	[LATIN SMALL LETTER U WITH MACRON]
			case 0x16D: // u	[LATIN SMALL LETTER U WITH BREVE]
			case 0x16F: // u	[LATIN SMALL LETTER U WITH RING ABOVE]
			case 0x171: // u	[LATIN SMALL LETTER U WITH DOUBLE ACUTE]
			case 0x173: // u	[LATIN SMALL LETTER U WITH OGONEK]
			case 0x1B0: // u	[LATIN SMALL LETTER U WITH HORN]
			case 0x1D4: // u	[LATIN SMALL LETTER U WITH CARON]
			case 0x1D6: // u	[LATIN SMALL LETTER U WITH DIAERESIS AND MACRON]
			case 0x1D8: // u	[LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE]
			case 0x1DA: // u	[LATIN SMALL LETTER U WITH DIAERESIS AND CARON]
			case 0x1DC: // u	[LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE]
			case 0x215: // ?	[LATIN SMALL LETTER U WITH DOUBLE GRAVE]
			case 0x217: // ?	[LATIN SMALL LETTER U WITH INVERTED BREVE]
			case 0x289: // ?	[LATIN SMALL LETTER U BAR]
			case 0x1D64: // ?	[LATIN SUBSCRIPT SMALL LETTER U]
			case 0x1D99: // ?	[LATIN SMALL LETTER U WITH RETROFLEX HOOK]
			case 0x1E73: // ?	[LATIN SMALL LETTER U WITH DIAERESIS BELOW]
			case 0x1E75: // ?	[LATIN SMALL LETTER U WITH TILDE BELOW]
			case 0x1E77: // ?	[LATIN SMALL LETTER U WITH CIRCUMFLEX BELOW]
			case 0x1E79: // ?	[LATIN SMALL LETTER U WITH TILDE AND ACUTE]
			case 0x1E7B: // ?	[LATIN SMALL LETTER U WITH MACRON AND DIAERESIS]
			case 0x1EE5: // ?	[LATIN SMALL LETTER U WITH DOT BELOW]
			case 0x1EE7: // ?	[LATIN SMALL LETTER U WITH HOOK ABOVE]
			case 0x1EE9: // ?	[LATIN SMALL LETTER U WITH HORN AND ACUTE]
			case 0x1EEB: // ?	[LATIN SMALL LETTER U WITH HORN AND GRAVE]
			case 0x1EED: // ?	[LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE]
			case 0x1EEF: // ?	[LATIN SMALL LETTER U WITH HORN AND TILDE]
			case 0x1EF1: // ?	[LATIN SMALL LETTER U WITH HORN AND DOT BELOW]
			case 0x24E4: // ?	[CIRCLED LATIN SMALL LETTER U]
			case 0xFF55: // u	[FULLWIDTH LATIN SMALL LETTER U]
				outString += "u";
				break;
			case 0x24B0: // ?	[PARENTHESIZED LATIN SMALL LETTER U]
				outString += "(";
				outString += "u";
				outString += ")";
				break;
			case 0x1D6B: // ?	[LATIN SMALL LETTER UE]
				outString += "u";
				outString += "e";
				break;
			case 0x1B2: // ?	[LATIN CAPITAL LETTER V WITH HOOK]
			case 0x245: // ?	[LATIN CAPITAL LETTER TURNED V]
			case 0x1D20: // ?	[LATIN LETTER SMALL CAPITAL V]
			case 0x1E7C: // ?	[LATIN CAPITAL LETTER V WITH TILDE]
			case 0x1E7E: // ?	[LATIN CAPITAL LETTER V WITH DOT BELOW]
			case 0x1EFC: // ?	[LATIN CAPITAL LETTER MIDDLE-WELSH V]
			case 0x24CB: // ?	[CIRCLED LATIN CAPITAL LETTER V]
			case 0xA75E: // ?	[LATIN CAPITAL LETTER V WITH DIAGONAL STROKE]
			case 0xA768: // ?	[LATIN CAPITAL LETTER VEND]
			case 0xFF36: // V	[FULLWIDTH LATIN CAPITAL LETTER V]
				outString += "V";
				break;
			case 0x28B: // ?	[LATIN SMALL LETTER V WITH HOOK]
			case 0x28C: // ?	[LATIN SMALL LETTER TURNED V]
			case 0x1D65: // ?	[LATIN SUBSCRIPT SMALL LETTER V]
			case 0x1D8C: // ?	[LATIN SMALL LETTER V WITH PALATAL HOOK]
			case 0x1E7D: // ?	[LATIN SMALL LETTER V WITH TILDE]
			case 0x1E7F: // ?	[LATIN SMALL LETTER V WITH DOT BELOW]
			case 0x24E5: // ?	[CIRCLED LATIN SMALL LETTER V]
			case 0x2C71: // ?	[LATIN SMALL LETTER V WITH RIGHT HOOK]
			case 0x2C74: // ?	[LATIN SMALL LETTER V WITH CURL]
			case 0xA75F: // ?	[LATIN SMALL LETTER V WITH DIAGONAL STROKE]
			case 0xFF56: // v	[FULLWIDTH LATIN SMALL LETTER V]
				outString += "v";
				break;
			case 0xA760: // ?	[LATIN CAPITAL LETTER VY]
				outString += "V";
				outString += "Y";
				break;
			case 0x24B1: // ?	[PARENTHESIZED LATIN SMALL LETTER V]
				outString += "(";
				outString += "v";
				outString += ")";
				break;
			case 0xA761: // ?	[LATIN SMALL LETTER VY]
				outString += "v";
				outString += "y";
				break;
			case 0x174: // W	[LATIN CAPITAL LETTER W WITH CIRCUMFLEX]
			case 0x1F7: // ?	http;//en.wikipedia.org/wiki/Wynn	[LATIN CAPITAL LETTER WYNN]
			case 0x1D21: // ?	[LATIN LETTER SMALL CAPITAL W]
			case 0x1E80: // ?	[LATIN CAPITAL LETTER W WITH GRAVE]
			case 0x1E82: // ?	[LATIN CAPITAL LETTER W WITH ACUTE]
			case 0x1E84: // ?	[LATIN CAPITAL LETTER W WITH DIAERESIS]
			case 0x1E86: // ?	[LATIN CAPITAL LETTER W WITH DOT ABOVE]
			case 0x1E88: // ?	[LATIN CAPITAL LETTER W WITH DOT BELOW]
			case 0x24CC: // ?	[CIRCLED LATIN CAPITAL LETTER W]
			case 0x2C72: // ?	[LATIN CAPITAL LETTER W WITH HOOK]
			case 0xFF37: // W	[FULLWIDTH LATIN CAPITAL LETTER W]
				outString += "W";
				break;
			case 0x175: // w	[LATIN SMALL LETTER W WITH CIRCUMFLEX]
			case 0x1BF: // ?	http;//en.wikipedia.org/wiki/Wynn	[LATIN LETTER WYNN]
			case 0x28D: // ?	[LATIN SMALL LETTER TURNED W]
			case 0x1E81: // ?	[LATIN SMALL LETTER W WITH GRAVE]
			case 0x1E83: // ?	[LATIN SMALL LETTER W WITH ACUTE]
			case 0x1E85: // ?	[LATIN SMALL LETTER W WITH DIAERESIS]
			case 0x1E87: // ?	[LATIN SMALL LETTER W WITH DOT ABOVE]
			case 0x1E89: // ?	[LATIN SMALL LETTER W WITH DOT BELOW]
			case 0x1E98: // ?	[LATIN SMALL LETTER W WITH RING ABOVE]
			case 0x24E6: // ?	[CIRCLED LATIN SMALL LETTER W]
			case 0x2C73: // ?	[LATIN SMALL LETTER W WITH HOOK]
			case 0xFF57: // w	[FULLWIDTH LATIN SMALL LETTER W]
				outString += "w";
				break;
			case 0x24B2: // ?	[PARENTHESIZED LATIN SMALL LETTER W]
				outString += "(";
				outString += "w";
				outString += ")";
				break;
			case 0x1E8A: // ?	[LATIN CAPITAL LETTER X WITH DOT ABOVE]
			case 0x1E8C: // ?	[LATIN CAPITAL LETTER X WITH DIAERESIS]
			case 0x24CD: // ?	[CIRCLED LATIN CAPITAL LETTER X]
			case 0xFF38: // X	[FULLWIDTH LATIN CAPITAL LETTER X]
				outString += "X";
				break;
			case 0x1D8D: // ?	[LATIN SMALL LETTER X WITH PALATAL HOOK]
			case 0x1E8B: // ?	[LATIN SMALL LETTER X WITH DOT ABOVE]
			case 0x1E8D: // ?	[LATIN SMALL LETTER X WITH DIAERESIS]
			case 0x2093: // ?	[LATIN SUBSCRIPT SMALL LETTER X]
			case 0x24E7: // ?	[CIRCLED LATIN SMALL LETTER X]
			case 0xFF58: // x	[FULLWIDTH LATIN SMALL LETTER X]
				outString += "x";
				break;
			case 0x24B3: // ?	[PARENTHESIZED LATIN SMALL LETTER X]
				outString += "(";
				outString += "x";
				outString += ")";
				break;
			case 0xDD: // Ý	[LATIN CAPITAL LETTER Y WITH ACUTE]
			case 0x176: // Y	[LATIN CAPITAL LETTER Y WITH CIRCUMFLEX]
			case 0x178: // Ÿ	[LATIN CAPITAL LETTER Y WITH DIAERESIS]
			case 0x1B3: // ?	[LATIN CAPITAL LETTER Y WITH HOOK]
			case 0x232: // ?	[LATIN CAPITAL LETTER Y WITH MACRON]
			case 0x24E: // ?	[LATIN CAPITAL LETTER Y WITH STROKE]
			case 0x28F: // ?	[LATIN LETTER SMALL CAPITAL Y]
			case 0x1E8E: // ?	[LATIN CAPITAL LETTER Y WITH DOT ABOVE]
			case 0x1EF2: // ?	[LATIN CAPITAL LETTER Y WITH GRAVE]
			case 0x1EF4: // ?	[LATIN CAPITAL LETTER Y WITH DOT BELOW]
			case 0x1EF6: // ?	[LATIN CAPITAL LETTER Y WITH HOOK ABOVE]
			case 0x1EF8: // ?	[LATIN CAPITAL LETTER Y WITH TILDE]
			case 0x1EFE: // ?	[LATIN CAPITAL LETTER Y WITH LOOP]
			case 0x24CE: // ?	[CIRCLED LATIN CAPITAL LETTER Y]
			case 0xFF39: // Y	[FULLWIDTH LATIN CAPITAL LETTER Y]
				outString += "Y";
				break;
			case 0xFD: // ý	[LATIN SMALL LETTER Y WITH ACUTE]
			case 0xFF: // ÿ	[LATIN SMALL LETTER Y WITH DIAERESIS]
			case 0x177: // y	[LATIN SMALL LETTER Y WITH CIRCUMFLEX]
			case 0x1B4: // ?	[LATIN SMALL LETTER Y WITH HOOK]
			case 0x233: // ?	[LATIN SMALL LETTER Y WITH MACRON]
			case 0x24F: // ?	[LATIN SMALL LETTER Y WITH STROKE]
			case 0x28E: // ?	[LATIN SMALL LETTER TURNED Y]
			case 0x1E8F: // ?	[LATIN SMALL LETTER Y WITH DOT ABOVE]
			case 0x1E99: // ?	[LATIN SMALL LETTER Y WITH RING ABOVE]
			case 0x1EF3: // ?	[LATIN SMALL LETTER Y WITH GRAVE]
			case 0x1EF5: // ?	[LATIN SMALL LETTER Y WITH DOT BELOW]
			case 0x1EF7: // ?	[LATIN SMALL LETTER Y WITH HOOK ABOVE]
			case 0x1EF9: // ?	[LATIN SMALL LETTER Y WITH TILDE]
			case 0x1EFF: // ?	[LATIN SMALL LETTER Y WITH LOOP]
			case 0x24E8: // ?	[CIRCLED LATIN SMALL LETTER Y]
			case 0xFF59: // y	[FULLWIDTH LATIN SMALL LETTER Y]
				outString += "y";
				break;
			case 0x24B4: // ?	[PARENTHESIZED LATIN SMALL LETTER Y]
				outString += "(";
				outString += "y";
				outString += ")";
				break;
			case 0x179: // Z	[LATIN CAPITAL LETTER Z WITH ACUTE]
			case 0x17B: // Z	[LATIN CAPITAL LETTER Z WITH DOT ABOVE]
			case 0x17D: // Ž	[LATIN CAPITAL LETTER Z WITH CARON]
			case 0x1B5: // ?	[LATIN CAPITAL LETTER Z WITH STROKE]
			case 0x21C: // ?	http;//en.wikipedia.org/wiki/Yogh	[LATIN CAPITAL LETTER YOGH]
			case 0x224: // ?	[LATIN CAPITAL LETTER Z WITH HOOK]
			case 0x1D22: // ?	[LATIN LETTER SMALL CAPITAL Z]
			case 0x1E90: // ?	[LATIN CAPITAL LETTER Z WITH CIRCUMFLEX]
			case 0x1E92: // ?	[LATIN CAPITAL LETTER Z WITH DOT BELOW]
			case 0x1E94: // ?	[LATIN CAPITAL LETTER Z WITH LINE BELOW]
			case 0x24CF: // ?	[CIRCLED LATIN CAPITAL LETTER Z]
			case 0x2C6B: // ?	[LATIN CAPITAL LETTER Z WITH DESCENDER]
			case 0xA762: // ?	[LATIN CAPITAL LETTER VISIGOTHIC Z]
			case 0xFF3A: // Z	[FULLWIDTH LATIN CAPITAL LETTER Z]
				outString += "Z";
				break;
			case 0x17A: // z	[LATIN SMALL LETTER Z WITH ACUTE]
			case 0x17C: // z	[LATIN SMALL LETTER Z WITH DOT ABOVE]
			case 0x17E: // ž	[LATIN SMALL LETTER Z WITH CARON]
			case 0x1B6: // z	[LATIN SMALL LETTER Z WITH STROKE]
			case 0x21D: // ?	http;//en.wikipedia.org/wiki/Yogh	[LATIN SMALL LETTER YOGH]
			case 0x225: // ?	[LATIN SMALL LETTER Z WITH HOOK]
			case 0x240: // ?	[LATIN SMALL LETTER Z WITH SWASH TAIL]
			case 0x290: // ?	[LATIN SMALL LETTER Z WITH RETROFLEX HOOK]
			case 0x291: // ?	[LATIN SMALL LETTER Z WITH CURL]
			case 0x1D76: // ?	[LATIN SMALL LETTER Z WITH MIDDLE TILDE]
			case 0x1D8E: // ?	[LATIN SMALL LETTER Z WITH PALATAL HOOK]
			case 0x1E91: // ?	[LATIN SMALL LETTER Z WITH CIRCUMFLEX]
			case 0x1E93: // ?	[LATIN SMALL LETTER Z WITH DOT BELOW]
			case 0x1E95: // ?	[LATIN SMALL LETTER Z WITH LINE BELOW]
			case 0x24E9: // ?	[CIRCLED LATIN SMALL LETTER Z]
			case 0x2C6C: // ?	[LATIN SMALL LETTER Z WITH DESCENDER]
			case 0xA763: // ?	[LATIN SMALL LETTER VISIGOTHIC Z]
			case 0xFF5A: // z	[FULLWIDTH LATIN SMALL LETTER Z]
				outString += "z";
				break;
			case 0x24B5: // ?	[PARENTHESIZED LATIN SMALL LETTER Z]
				outString += "(";
				outString += "z";
				outString += ")";
				break;
			case 0x2070: // °	[SUPERSCRIPT ZERO]
			case 0x2080: // 0	[SUBSCRIPT ZERO]
			case 0x24EA: // ?	[CIRCLED DIGIT ZERO]
			case 0x24FF: // ?	[NEGATIVE CIRCLED DIGIT ZERO]
			case 0xFF10: // 0	[FULLWIDTH DIGIT ZERO]
				outString += "0";
				break;
			case 0xB9: // ¹	[SUPERSCRIPT ONE]
			case 0x2081: // 1	[SUBSCRIPT ONE]
			case 0x2460: // ?	[CIRCLED DIGIT ONE]
			case 0x24F5: // ?	[DOUBLE CIRCLED DIGIT ONE]
			case 0x2776: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT ONE]
			case 0x2780: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT ONE]
			case 0x278A: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT ONE]
			case 0xFF11: // 1	[FULLWIDTH DIGIT ONE]
				outString += "1";
				break;
			case 0x2488: // ?	[DIGIT ONE FULL STOP]
				outString += "1";
				outString += ".";
				break;
			case 0x2474: // ?	[PARENTHESIZED DIGIT ONE]
				outString += "(";
				outString += "1";
				outString += ")";
				break;
			case 0xB2: // ²	[SUPERSCRIPT TWO]
			case 0x2082: // 2	[SUBSCRIPT TWO]
			case 0x2461: // ?	[CIRCLED DIGIT TWO]
			case 0x24F6: // ?	[DOUBLE CIRCLED DIGIT TWO]
			case 0x2777: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT TWO]
			case 0x2781: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT TWO]
			case 0x278B: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT TWO]
			case 0xFF12: // 2	[FULLWIDTH DIGIT TWO]
				outString += "2";
				break;
			case 0x2489: // ?	[DIGIT TWO FULL STOP]
				outString += "2";
				outString += ".";
				break;
			case 0x2475: // ?	[PARENTHESIZED DIGIT TWO]
				outString += "(";
				outString += "2";
				outString += ")";
				break;
			case 0xB3: // ³	[SUPERSCRIPT THREE]
			case 0x2083: // 3	[SUBSCRIPT THREE]
			case 0x2462: // ?	[CIRCLED DIGIT THREE]
			case 0x24F7: // ?	[DOUBLE CIRCLED DIGIT THREE]
			case 0x2778: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT THREE]
			case 0x2782: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT THREE]
			case 0x278C: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT THREE]
			case 0xFF13: // 3	[FULLWIDTH DIGIT THREE]
				outString += "3";
				break;
			case 0x248A: // ?	[DIGIT THREE FULL STOP]
				outString += "3";
				outString += ".";
				break;
			case 0x2476: // ?	[PARENTHESIZED DIGIT THREE]
				outString += "(";
				outString += "3";
				outString += ")";
				break;
			case 0x2074: // 4	[SUPERSCRIPT FOUR]
			case 0x2084: // 4	[SUBSCRIPT FOUR]
			case 0x2463: // ?	[CIRCLED DIGIT FOUR]
			case 0x24F8: // ?	[DOUBLE CIRCLED DIGIT FOUR]
			case 0x2779: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT FOUR]
			case 0x2783: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT FOUR]
			case 0x278D: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT FOUR]
			case 0xFF14: // 4	[FULLWIDTH DIGIT FOUR]
				outString += "4";
				break;
			case 0x248B: // ?	[DIGIT FOUR FULL STOP]
				outString += "4";
				outString += ".";
				break;
			case 0x2477: // ?	[PARENTHESIZED DIGIT FOUR]
				outString += "(";
				outString += "4";
				outString += ")";
				break;
			case 0x2075: // 5	[SUPERSCRIPT FIVE]
			case 0x2085: // 5	[SUBSCRIPT FIVE]
			case 0x2464: // ?	[CIRCLED DIGIT FIVE]
			case 0x24F9: // ?	[DOUBLE CIRCLED DIGIT FIVE]
			case 0x277A: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT FIVE]
			case 0x2784: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT FIVE]
			case 0x278E: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT FIVE]
			case 0xFF15: // 5	[FULLWIDTH DIGIT FIVE]
				outString += "5";
				break;
			case 0x248C: // ?	[DIGIT FIVE FULL STOP]
				outString += "5";
				outString += ".";
				break;
			case 0x2478: // ?	[PARENTHESIZED DIGIT FIVE]
				outString += "(";
				outString += "5";
				outString += ")";
				break;
			case 0x2076: // 6	[SUPERSCRIPT SIX]
			case 0x2086: // 6	[SUBSCRIPT SIX]
			case 0x2465: // ?	[CIRCLED DIGIT SIX]
			case 0x24FA: // ?	[DOUBLE CIRCLED DIGIT SIX]
			case 0x277B: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT SIX]
			case 0x2785: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT SIX]
			case 0x278F: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT SIX]
			case 0xFF16: // 6	[FULLWIDTH DIGIT SIX]
				outString += "6";
				break;
			case 0x248D: // ?	[DIGIT SIX FULL STOP]
				outString += "6";
				outString += ".";
				break;
			case 0x2479: // ?	[PARENTHESIZED DIGIT SIX]
				outString += "(";
				outString += "6";
				outString += ")";
				break;
			case 0x2077: // 7	[SUPERSCRIPT SEVEN]
			case 0x2087: // 7	[SUBSCRIPT SEVEN]
			case 0x2466: // ?	[CIRCLED DIGIT SEVEN]
			case 0x24FB: // ?	[DOUBLE CIRCLED DIGIT SEVEN]
			case 0x277C: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT SEVEN]
			case 0x2786: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT SEVEN]
			case 0x2790: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT SEVEN]
			case 0xFF17: // 7	[FULLWIDTH DIGIT SEVEN]
				outString += "7";
				break;
			case 0x248E: // ?	[DIGIT SEVEN FULL STOP]
				outString += "7";
				outString += ".";
				break;
			case 0x247A: // ?	[PARENTHESIZED DIGIT SEVEN]
				outString += "(";
				outString += "7";
				outString += ")";
				break;
			case 0x2078: // 8	[SUPERSCRIPT EIGHT]
			case 0x2088: // 8	[SUBSCRIPT EIGHT]
			case 0x2467: // ?	[CIRCLED DIGIT EIGHT]
			case 0x24FC: // ?	[DOUBLE CIRCLED DIGIT EIGHT]
			case 0x277D: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT EIGHT]
			case 0x2787: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT EIGHT]
			case 0x2791: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT EIGHT]
			case 0xFF18: // 8	[FULLWIDTH DIGIT EIGHT]
				outString += "8";
				break;
			case 0x248F: // ?	[DIGIT EIGHT FULL STOP]
				outString += "8";
				outString += ".";
				break;
			case 0x247B: // ?	[PARENTHESIZED DIGIT EIGHT]
				outString += "(";
				outString += "8";
				outString += ")";
				break;
			case 0x2079: // ?	[SUPERSCRIPT NINE]
			case 0x2089: // 9	[SUBSCRIPT NINE]
			case 0x2468: // ?	[CIRCLED DIGIT NINE]
			case 0x24FD: // ?	[DOUBLE CIRCLED DIGIT NINE]
			case 0x277E: // ?	[DINGBAT NEGATIVE CIRCLED DIGIT NINE]
			case 0x2788: // ?	[DINGBAT CIRCLED SANS-SERIF DIGIT NINE]
			case 0x2792: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF DIGIT NINE]
			case 0xFF19: // 9	[FULLWIDTH DIGIT NINE]
				outString += "9";
				break;
			case 0x2490: // ?	[DIGIT NINE FULL STOP]
				outString += "9";
				outString += ".";
				break;
			case 0x247C: // ?	[PARENTHESIZED DIGIT NINE]
				outString += "(";
				outString += "9";
				outString += ")";
				break;
			case 0x2469: // ?	[CIRCLED NUMBER TEN]
			case 0x24FE: // ?	[DOUBLE CIRCLED NUMBER TEN]
			case 0x277F: // ?	[DINGBAT NEGATIVE CIRCLED NUMBER TEN]
			case 0x2789: // ?	[DINGBAT CIRCLED SANS-SERIF NUMBER TEN]
			case 0x2793: // ?	[DINGBAT NEGATIVE CIRCLED SANS-SERIF NUMBER TEN]
				outString += "1";
				outString += "0";
				break;
			case 0x2491: // ?	[NUMBER TEN FULL STOP]
				outString += "1";
				outString += "0";
				outString += ".";
				break;
			case 0x247D: // ?	[PARENTHESIZED NUMBER TEN]
				outString += "(";
				outString += "1";
				outString += "0";
				outString += ")";
				break;
			case 0x246A: // ?	[CIRCLED NUMBER ELEVEN]
			case 0x24EB: // ?	[NEGATIVE CIRCLED NUMBER ELEVEN]
				outString += "1";
				outString += "1";
				break;
			case 0x2492: // ?	[NUMBER ELEVEN FULL STOP]
				outString += "1";
				outString += "1";
				outString += ".";
				break;
			case 0x247E: // ?	[PARENTHESIZED NUMBER ELEVEN]
				outString += "(";
				outString += "1";
				outString += "1";
				outString += ")";
				break;
			case 0x246B: // ?	[CIRCLED NUMBER TWELVE]
			case 0x24EC: // ?	[NEGATIVE CIRCLED NUMBER TWELVE]
				outString += "1";
				outString += "2";
				break;
			case 0x2493: // ?	[NUMBER TWELVE FULL STOP]
				outString += "1";
				outString += "2";
				outString += ".";
				break;
			case 0x247F: // ?	[PARENTHESIZED NUMBER TWELVE]
				outString += "(";
				outString += "1";
				outString += "2";
				outString += ")";
				break;
			case 0x246C: // ?	[CIRCLED NUMBER THIRTEEN]
			case 0x24ED: // ?	[NEGATIVE CIRCLED NUMBER THIRTEEN]
				outString += "1";
				outString += "3";
				break;
			case 0x2494: // ?	[NUMBER THIRTEEN FULL STOP]
				outString += "1";
				outString += "3";
				outString += ".";
				break;
			case 0x2480: // ?	[PARENTHESIZED NUMBER THIRTEEN]
				outString += "(";
				outString += "1";
				outString += "3";
				outString += ")";
				break;
			case 0x246D: // ?	[CIRCLED NUMBER FOURTEEN]
			case 0x24EE: // ?	[NEGATIVE CIRCLED NUMBER FOURTEEN]
				outString += "1";
				outString += "4";
				break;
			case 0x2495: // ?	[NUMBER FOURTEEN FULL STOP]
				outString += "1";
				outString += "4";
				outString += ".";
				break;
			case 0x2481: // ?	[PARENTHESIZED NUMBER FOURTEEN]
				outString += "(";
				outString += "1";
				outString += "4";
				outString += ")";
				break;
			case 0x246E: // ?	[CIRCLED NUMBER FIFTEEN]
			case 0x24EF: // ?	[NEGATIVE CIRCLED NUMBER FIFTEEN]
				outString += "1";
				outString += "5";
				break;
			case 0x2496: // ?	[NUMBER FIFTEEN FULL STOP]
				outString += "1";
				outString += "5";
				outString += ".";
				break;
			case 0x2482: // ?	[PARENTHESIZED NUMBER FIFTEEN]
				outString += "(";
				outString += "1";
				outString += "5";
				outString += ")";
				break;
			case 0x246F: // ?	[CIRCLED NUMBER SIXTEEN]
			case 0x24F0: // ?	[NEGATIVE CIRCLED NUMBER SIXTEEN]
				outString += "1";
				outString += "6";
				break;
			case 0x2497: // ?	[NUMBER SIXTEEN FULL STOP]
				outString += "1";
				outString += "6";
				outString += ".";
				break;
			case 0x2483: // ?	[PARENTHESIZED NUMBER SIXTEEN]
				outString += "(";
				outString += "1";
				outString += "6";
				outString += ")";
				break;
			case 0x2470: // ?	[CIRCLED NUMBER SEVENTEEN]
			case 0x24F1: // ?	[NEGATIVE CIRCLED NUMBER SEVENTEEN]
				outString += "1";
				outString += "7";
				break;
			case 0x2498: // ?	[NUMBER SEVENTEEN FULL STOP]
				outString += "1";
				outString += "7";
				outString += ".";
				break;
			case 0x2484: // ?	[PARENTHESIZED NUMBER SEVENTEEN]
				outString += "(";
				outString += "1";
				outString += "7";
				outString += ")";
				break;
			case 0x2471: // ?	[CIRCLED NUMBER EIGHTEEN]
			case 0x24F2: // ?	[NEGATIVE CIRCLED NUMBER EIGHTEEN]
				outString += "1";
				outString += "8";
				break;
			case 0x2499: // ?	[NUMBER EIGHTEEN FULL STOP]
				outString += "1";
				outString += "8";
				outString += ".";
				break;
			case 0x2485: // ?	[PARENTHESIZED NUMBER EIGHTEEN]
				outString += "(";
				outString += "1";
				outString += "8";
				outString += ")";
				break;
			case 0x2472: // ?	[CIRCLED NUMBER NINETEEN]
			case 0x24F3: // ?	[NEGATIVE CIRCLED NUMBER NINETEEN]
				outString += "1";
				outString += "9";
				break;
			case 0x249A: // ?	[NUMBER NINETEEN FULL STOP]
				outString += "1";
				outString += "9";
				outString += ".";
				break;
			case 0x2486: // ?	[PARENTHESIZED NUMBER NINETEEN]
				outString += "(";
				outString += "1";
				outString += "9";
				outString += ")";
				break;
			case 0x2473: // ?	[CIRCLED NUMBER TWENTY]
			case 0x24F4: // ?	[NEGATIVE CIRCLED NUMBER TWENTY]
				outString += "2";
				outString += "0";
				break;
			case 0x249B: // ?	[NUMBER TWENTY FULL STOP]
				outString += "2";
				outString += "0";
				outString += ".";
				break;
			case 0x2487: // ?	[PARENTHESIZED NUMBER TWENTY]
				outString += "(";
				outString += "2";
				outString += "0";
				outString += ")";
				break;
			case 0xAB: // «	[LEFT-POINTING DOUBLE ANGLE QUOTATION MARK]
			case 0xBB: // »	[RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK]
			case 0x201C: // “	[LEFT DOUBLE QUOTATION MARK]
			case 0x201D: // ”	[RIGHT DOUBLE QUOTATION MARK]
			case 0x201E: // „	[DOUBLE LOW-9 QUOTATION MARK]
			case 0x2033: // ?	[DOUBLE PRIME]
			case 0x2036: // ?	[REVERSED DOUBLE PRIME]
			case 0x275D: // ?	[HEAVY DOUBLE TURNED COMMA QUOTATION MARK ORNAMENT]
			case 0x275E: // ?	[HEAVY DOUBLE COMMA QUOTATION MARK ORNAMENT]
			case 0x276E: // ?	[HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT]
			case 0x276F: // ?	[HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT]
			case 0xFF02: // "	[FULLWIDTH QUOTATION MARK]
				outString += "\"";
				break;
			case 0x2018: // ‘	[LEFT SINGLE QUOTATION MARK]
			case 0x2019: // ’	[RIGHT SINGLE QUOTATION MARK]
			case 0x201A: // ‚	[SINGLE LOW-9 QUOTATION MARK]
			case 0x201B: // ?	[SINGLE HIGH-REVERSED-9 QUOTATION MARK]
			case 0x2032: // '	[PRIME]
			case 0x2035: // `	[REVERSED PRIME]
			case 0x2039: // ‹	[SINGLE LEFT-POINTING ANGLE QUOTATION MARK]
			case 0x203A: // ›	[SINGLE RIGHT-POINTING ANGLE QUOTATION MARK]
			case 0x275B: // ?	[HEAVY SINGLE TURNED COMMA QUOTATION MARK ORNAMENT]
			case 0x275C: // ?	[HEAVY SINGLE COMMA QUOTATION MARK ORNAMENT]
			case 0xFF07: // '	[FULLWIDTH APOSTROPHE]
				outString += "'";
				break;
			case 0x2010: // -	[HYPHEN]
			case 0x2011: // -	[NON-BREAKING HYPHEN]
			case 0x2012: // ?	[FIGURE DASH]
			case 0x2013: // –	[EN DASH]
			case 0x2014: // —	[EM DASH]
			case 0x207B: // ?	[SUPERSCRIPT MINUS]
			case 0x208B: // ?	[SUBSCRIPT MINUS]
			case 0xFF0D: // -	[FULLWIDTH HYPHEN-MINUS]
				outString += "-";
				break;
			case 0x2045: // ?	[LEFT SQUARE BRACKET WITH QUILL]
			case 0x2772: // ?	[LIGHT LEFT TORTOISE SHELL BRACKET ORNAMENT]
			case 0xFF3B: // [	[FULLWIDTH LEFT SQUARE BRACKET]
				outString += "[";
				break;
			case 0x2046: // ?	[RIGHT SQUARE BRACKET WITH QUILL]
			case 0x2773: // ?	[LIGHT RIGHT TORTOISE SHELL BRACKET ORNAMENT]
			case 0xFF3D: // ]	[FULLWIDTH RIGHT SQUARE BRACKET]
				outString += "]";
				break;
			case 0x207D: // ?	[SUPERSCRIPT LEFT PARENTHESIS]
			case 0x208D: // ?	[SUBSCRIPT LEFT PARENTHESIS]
			case 0x2768: // ?	[MEDIUM LEFT PARENTHESIS ORNAMENT]
			case 0x276A: // ?	[MEDIUM FLATTENED LEFT PARENTHESIS ORNAMENT]
			case 0xFF08: // (	[FULLWIDTH LEFT PARENTHESIS]
				outString += "(";
				break;
			case 0x2E28: // ?	[LEFT DOUBLE PARENTHESIS]
				outString += "(";
				outString += "(";
				break;
			case 0x207E: // ?	[SUPERSCRIPT RIGHT PARENTHESIS]
			case 0x208E: // ?	[SUBSCRIPT RIGHT PARENTHESIS]
			case 0x2769: // ?	[MEDIUM RIGHT PARENTHESIS ORNAMENT]
			case 0x276B: // ?	[MEDIUM FLATTENED RIGHT PARENTHESIS ORNAMENT]
			case 0xFF09: // )	[FULLWIDTH RIGHT PARENTHESIS]
				outString += ")";
				break;
			case 0x2E29: // ?	[RIGHT DOUBLE PARENTHESIS]
				outString += ")";
				outString += ")";
				break;
			case 0x276C: // ?	[MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT]
			case 0x2770: // ?	[HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT]
			case 0xFF1C: // <	[FULLWIDTH LESS-THAN SIGN]
				outString += "<";
				break;
			case 0x276D: // ?	[MEDIUM RIGHT-POINTING ANGLE BRACKET ORNAMENT]
			case 0x2771: // ?	[HEAVY RIGHT-POINTING ANGLE BRACKET ORNAMENT]
			case 0xFF1E: // >	[FULLWIDTH GREATER-THAN SIGN]
				outString += ">";
				break;
			case 0x2774: // ?	[MEDIUM LEFT CURLY BRACKET ORNAMENT]
			case 0xFF5B: // {	[FULLWIDTH LEFT CURLY BRACKET]
				outString += "{";
				break;
			case 0x2775: // ?	[MEDIUM RIGHT CURLY BRACKET ORNAMENT]
			case 0xFF5D: // }	[FULLWIDTH RIGHT CURLY BRACKET]
				outString += "}";
				break;
			case 0x207A: // ?	[SUPERSCRIPT PLUS SIGN]
			case 0x208A: // ?	[SUBSCRIPT PLUS SIGN]
			case 0xFF0B: // +	[FULLWIDTH PLUS SIGN]
				outString += "+";
				break;
			case 0x207C: // ?	[SUPERSCRIPT EQUALS SIGN]
			case 0x208C: // ?	[SUBSCRIPT EQUALS SIGN]
			case 0xFF1D: // =	[FULLWIDTH EQUALS SIGN]
				outString += "=";
				break;
			case 0xFF01: // !	[FULLWIDTH EXCLAMATION MARK]
				outString += "!";
				break;
			case 0x203C: // ?	[DOUBLE EXCLAMATION MARK]
				outString += "!";
				outString += "!";
				break;
			case 0x2049: // ?	[EXCLAMATION QUESTION MARK]
				outString += "!";
				outString += "?";
				break;
			case 0xFF03: // #	[FULLWIDTH NUMBER SIGN]
				outString += "#";
				break;
			case 0xFF04: // $	[FULLWIDTH DOLLAR SIGN]
				outString += "$";
				break;
			case 0x2052: // ?	[COMMERCIAL MINUS SIGN]
			case 0xFF05: // %	[FULLWIDTH PERCENT SIGN]
				outString += "%";
				break;
			case 0xFF06: // &	[FULLWIDTH AMPERSAND]
				outString += "&";
				break;
			case 0x204E: // ?	[LOW ASTERISK]
			case 0xFF0A: // *	[FULLWIDTH ASTERISK]
				outString += "*";
				break;
			case 0xFF0C: // ,	[FULLWIDTH COMMA]
				outString += ",";
				break;
			case 0xFF0E: // .	[FULLWIDTH FULL STOP]
				outString += ".";
				break;
			case 0x2044: // /	[FRACTION SLASH]
			case 0xFF0F: // /	[FULLWIDTH SOLIDUS]
				outString += "/";
				break;
			case 0xFF1A: // :	[FULLWIDTH COLON]
				outString += ":";
				break;
			case 0x204F: // ?	[REVERSED SEMICOLON]
			case 0xFF1B: // ;	[FULLWIDTH SEMICOLON]
				outString += ";";
				break;
			case 0xFF1F: // ?	[FULLWIDTH QUESTION MARK]
				outString += "?";
				break;
			case 0x2047: // ?	[DOUBLE QUESTION MARK]
				outString += "?";
				outString += "?";
				break;
			case 0x2048: // ?	[QUESTION EXCLAMATION MARK]
				outString += "?";
				outString += "!";
				break;
			case 0xFF20: // @	[FULLWIDTH COMMERCIAL AT]
				outString += "@";
				break;
			case 0xFF3C: // \	[FULLWIDTH REVERSE SOLIDUS]
				outString += "\\";
				break;
			case 0x2038: // ?	[CARET]
			case 0xFF3E: // ^	[FULLWIDTH CIRCUMFLEX ACCENT]
				outString += "^";
				break;
			case 0xFF3F: // _	[FULLWIDTH LOW LINE]
				outString += "_";
				break;
			case 0x2053: // ?	[SWUNG DASH]
			case 0xFF5E: // ~	[FULLWIDTH TILDE]
				outString += "~";
				break;
			default:
				outString += (replaceUnmapped ? defaultString : String.fromCharCode(charCode));
				break;
		}
		
		return outString;
	};
}());