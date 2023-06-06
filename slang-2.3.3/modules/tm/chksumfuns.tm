\function{md5sum}
\synopsis{Compute an MD5 sum for a string}
\usage{String_Type md5sum (BString_Type bstr)}
\description
  The \ifun{md5sum} function computes the MD5 checksum for the
  specified binary string.  The function returns a string representing
  the hexadecimal representation of the checksum.
\seealso{md5sum_file, sha1sum}
\done

\function{md5sum_file}
\synopsis{Compute the MD5 sum for the contents of a file}
\usage{String_Type md5sum_file (String_Type|File_Type f)}
\description
  The \ifun{md5sum_file} computes the MD5 sum on the contents of a
  file.  The file may either be specified as a string giving the name
  of the file, or as an open stdio \dtype{File_Type} pointer.  The
  function returns a string representing the hexadecimal
  representation of the checksum.
\seealso{md5sum, sha1sum_file, sha1sum}
\done

\function{sha1sum}
\synopsis{Compute the SHA1 sum for a string}
\usage{String_Type sha1sum (BString_Type bstr)}
\description
  The \ifun{sha1sum} function computes the SHA1 checksum for the
  specified binary string.  The function returns a string representing
  the hexadecimal representation of the checksum.
\seealso{sha1sum_file, md5sum}
\done

\function{sha1sum_file}
\synopsis{Compute the SHA1 sum for the contents of a file}
\usage{String_Type sha1sum_file (String_Type|File_Type f)}
\description
  The \ifun{sha1sum_file} computes the SHA1 sum on the contents of a
  file.  The file may either be specified as a string giving the name
  of the file, or as an open stdio \dtype{File_Type} pointer.  The
  function returns a string representing the hexadecimal
  representation of the checksum.
\seealso{sha1sum, md5sum_file, md5sum}
\done

\function{crc8sum}
\synopsis{Compute an 8 bit CRC on a string}
\usage{UChar_Type crc8sum (BString_Type bstr)}
\description
  This function computes an 8 bit CRC for the specified string.  A
  number of variants that differ according to the polynomial, initial
  value (seed), input/output bit reflection, and the XOR out value.
  Supported variants include:
#v+
   cdma2000  ; poly=0x9B, seed=0xFF, refin=0, refout=0, xorout=0x00
   darc      ; poly=0x39, seed=0x00, refin=1, refout=1, xorout=0x00
   dvb-s2    ; poly=0xD5, seed=0x00, refin=0, refout=0, xorout=0x00
   ebu       ; poly=0x1D, seed=0xFF, refin=1, refout=1, xorout=0x00
   i-code    ; poly=0x1D, seed=0xFD, refin=0, refout=0, xorout=0x00
   itu       ; poly=0x07, seed=0x00, refin=0, refout=0, xorout=0x55
   maxim     ; poly=0x31, seed=0x00, refin=1, refout=1, xorout=0x00
   rohc      ; poly=0x07, seed=0xFF, refin=1, refout=1, xorout=0x00
   wcdma     ; poly=0x9B, seed=0x00, refin=1, refout=1, xorout=0x00
#v-
 The CRC-8 algorithm is specified via qualifiers.  The following
 specify the same CRC-8 algorthm:
#v+
   crc8 = crc8sum ("string" ; type="maxim");
   crc8 = crc8sum ("string" ; poly=0x31, refin=1, refout=1);
#v-
  The default CRC-8 algorithm is "dvb-s2".
\example
  This example shows how to compute the Maxim CRC-8 value on a file.
#v+
    fp = fopen (file, "rb");
    c = chksum_new("crc8"; type="maxim");
    while (-1 != fread_bytes (&buf, 4096, fp)
      c.accumulate (buf);
    crc8 = chksum_close ();
#v-
\notes
  This function is part of the \var{chksum} module:
#v+
    require("chksum");
#v-
\seealso{crc16sum, crc32sum, crc8sum_file}
\done

\function{crc8sum_file}
\synopsis{Compute the CRC-8 value for the contents of a file}
\usage{UChar_Type crc8sum_file (String_Type|File_Type f)}
\description
  The \ifun{crc8sum_file} function computes the CRC-8 sum on the
  contents of a file.  The file may either be specified as a string
  giving the name of the file, or as an open stdio \dtype{File_Type}
  pointer.  The function returns the 8-bit CRC value.

  Qualifiers are used to specifiy the CRC-8 variant.  See the
  documentation for \ivar{crc8sum} function for more information.
\seealso{crc8sum, crc32sum_file, sha1sum_file}
\done


\function{crc16sum}
\synopsis{Compute an 16 bit CRC on a string}
\usage{UInt16_Type crc16sum (BString_Type bstr)}
\description
  This function computes an 16 bit CRC for the specified string.  A
  number of variants that differ according to the polynomial, initial
  value (seed), input/output bit reflection, and the XOR out value.
  Supported variants include:
#v+
  ccitt-0    ; poly=0x1021U, seed=0xFFFFU, refin=0, refout=0, xorout=0x0000U
  arc        ; poly=0x8005U, seed=0x0000U, refin=1, refout=1, xorout=0x0000U
  aug-ccitt  ; poly=0x1021U, seed=0x1D0FU, refin=0, refout=0, xorout=0x0000U
  buypass    ; poly=0x8005U, seed=0x0000U, refin=0, refout=0, xorout=0x0000U
  cdma2000   ; poly=0xC867U, seed=0xFFFFU, refin=0, refout=0, xorout=0x0000U
  dds-110    ; poly=0x8005U, seed=0x800DU, refin=0, refout=0, xorout=0x0000U
  dect-r     ; poly=0x0589U, seed=0x0000U, refin=0, refout=0, xorout=0x0001U
  dect-x     ; poly=0x0589U, seed=0x0000U, refin=0, refout=0, xorout=0x0000U
  dnp        ; poly=0x3D65U, seed=0x0000U, refin=1, refout=1, xorout=0xFFFFU
  en-13757   ; poly=0x3D65U, seed=0x0000U, refin=0, refout=0, xorout=0xFFFFU
  genibus    ; poly=0x1021U, seed=0xFFFFU, refin=0, refout=0, xorout=0xFFFFU
  maxim      ; poly=0x8005U, seed=0x0000U, refin=1, refout=1, xorout=0xFFFFU
  mcrf4xx    ; poly=0x1021U, seed=0xFFFFU, refin=1, refout=1, xorout=0x0000U
  riello     ; poly=0x1021U, seed=0xB2AAU, refin=1, refout=1, xorout=0x0000U
  t10-dif    ; poly=0x8BB7U, seed=0x0000U, refin=0, refout=0, xorout=0x0000U
  teledisk   ; poly=0xA097U, seed=0x0000U, refin=0, refout=0, xorout=0x0000U
  tms37157   ; poly=0x1021U, seed=0x89ECU, refin=1, refout=1, xorout=0x0000U
  usb        ; poly=0x8005U, seed=0xFFFFU, refin=1, refout=1, xorout=0xFFFFU
  a          ; poly=0x1021U, seed=0xC6C6U, refin=1, refout=1, xorout=0x0000U
  kermit     ; poly=0x1021U, seed=0x0000U, refin=1, refout=1, xorout=0x0000U
  modbus     ; poly=0x8005U, seed=0xFFFFU, refin=1, refout=1, xorout=0x0000U
  x-25       ; poly=0x1021U, seed=0xFFFFU, refin=1, refout=1, xorout=0xFFFFU
  xmodem     ; poly=0x1021U, seed=0x0000U, refin=0, refout=0, xorout=0x0000U
#v-
 The CRC-16 algorithm is specified via qualifiers.  The following
 specify the same CRC-16 algorthm:
#v+
   crc16 = crc16sum ("string" ; type="arc");
   crc16 = crc16sum ("string" ; poly=0x8005U, refin=1, refout=1);
#v-
  The default CRC-16 algorithm is "ccitt-0".
\example
  This example shows how to compute the Maxim CRC-16 value on a file.
#v+
    fp = fopen (file, "rb");
    c = chksum_new("crc16"; type="maxim");
    while (-1 != fread_bytes (&buf, 4096, fp)
      c.accumulate (buf);
    crc16 = chksum_close ();
#v-
\notes
  This function is part of the \var{chksum} module:
#v+
    require("chksum");
#v-
\seealso{crc8sum, crc32sum, crc16sum_file}
\done

\function{crc16sum_file}
\synopsis{Compute the CRC-16 value for the contents of a file}
\usage{UInt16_Type crc16sum_file (String_Type|File_Type f)}
\description
  The \ifun{crc16sum_file} function computes the CRC-16 sum on the
  contents of a file.  The file may either be specified as a string
  giving the name of the file, or as an open stdio \dtype{File_Type}
  pointer.  The function returns the 16-bit CRC value.

  Qualifiers are used to specifiy the CRC-16 variant.  See the
  documentation for \ivar{crc16sum} function for more information.
\seealso{crc16sum, crc32sum_file, sha1sum_file}
\done


\function{crc32sum}
\synopsis{Compute an 32 bit CRC on a string}
\usage{UInt32_Type crc32sum (BString_Type bstr)}
\description
  This function computes an 32 bit CRC for the specified string.  A
  number of variants that differ according to the polynomial, initial
  value (seed), input/output bit reflection, and the XOR out value.
  Supported variants include:
#v+
(default); poly=0x04C11DB7U, seed=0xFFFFFFFFU, refin=1, refout=1, xorout=0xFFFFFFFFU
  bzip2  ; poly=0x04C11DB7U, seed=0xFFFFFFFFU, refin=0, refout=0, xorout=0xFFFFFFFFU
  c      ; poly=0x1EDC6F41U, seed=0xFFFFFFFFU, refin=1, refout=1, xorout=0xFFFFFFFFU
  d      ; poly=0xA833982BU, seed=0xFFFFFFFFU, refin=1, refout=1, xorout=0xFFFFFFFFU
  mpeg-2 ; poly=0x04C11DB7U, seed=0xFFFFFFFFU, refin=0, refout=0, xorout=0x00000000U
  posix  ; poly=0x04C11DB7U, seed=0x00000000U, refin=0, refout=0, xorout=0xFFFFFFFFU
  q      ; poly=0x814141ABU, seed=0x00000000U, refin=0, refout=0, xorout=0x00000000U
  jamcrc ; poly=0x04C11DB7U, seed=0xFFFFFFFFU, refin=1, refout=1, xorout=0x00000000U
  xfer   ; poly=0x000000AFU, seed=0x00000000U, refin=0, refout=0, xorout=0x00000000U
#v-
 The CRC-32 algorithm is specified via qualifiers.  The following
 specify the same CRC-32 algorthm:
#v+
   crc32 = crc32sum ("string" ; type="posix");
   crc32 = crc32sum ("string" ; poly=0x04C11DB7U, xorout=0xFFFFFFFFU);
#v-
\example
  This example shows how to compute the default CRC-32 value on a file.
#v+
    fp = fopen (file, "rb");
    c = chksum_new("crc32");
    while (-1 != fread_bytes (&buf, 4096, fp)
      c.accumulate (buf);
    crc32 = chksum_close ();
#v-
\notes
  This function is part of the \var{chksum} module:
#v+
    require("chksum");
#v-
\seealso{crc8sum, crc32sum, crc32sum_file}
\done

\function{crc32sum_file}
\synopsis{Compute the CRC-32 value for the contents of a file}
\usage{UInt32_Type crc32sum_file (String_Type|File_Type f)}
\description
  The \ifun{crc32sum_file} function computes the CRC-32 sum on the
  contents of a file.  The file may either be specified as a string
  giving the name of the file, or as an open stdio \dtype{File_Type}
  pointer.  The function returns the 32-bit CRC value.

  Qualifiers are used to specifiy the CRC-32 variant.  See the
  documentation for \ivar{crc32sum} function for more information.
\seealso{crc32sum, crc16sum_file, sha1sum_file}
\done

