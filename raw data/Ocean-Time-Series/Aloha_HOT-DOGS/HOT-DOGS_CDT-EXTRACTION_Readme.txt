            Welcome to the HOT CTD Data Base
			June 18, 2008

HOT CTD data are collected using a SeaBird CTD 9-11 (9-11 Plus 
with dual sensors as of HOT-54) at the maximum sampling rate 
of 24 samples per second (24 Hz). They are screened for errors 
and processed to 2-dbar averages. Details of the CTD processing 
for each year can be found in HOT Data Reports #1-8 (see the
file Readme.first for information on how to obtain these Data
Reports).

CTD data are written to files using formats specified by the WOCE
Hydrographic Programme Office. These formats are based on NODC formats,
and are detailed in the WHP Office Report WHPO 90-1, available from
Steve Diggs, WHPO Data Manager, Scripps Institution of Oceanography,
9500 Gilman Drive, La Jolla, CA 92093-0214.

The files contain pressure, temperature and salinity profiles for all
casts. Some casts also have dissolved oxygen, light transmission,
and fluorescence. The data format consists of a self-documenting 
header followed by the data. The data records are written so that 
they can be read with a simple FORTRAN read statement. Details of 
this format are given in the file Readme.format.

The first year's temperatures are reported in IPTS-68.  Subsequent
temperatures are reported in ITS-90 units. Since temperature
sensor calibrations were done in IPTS-68 units, and the UNESCO
routines require IPTS-68 temperature, all intermediate
processing was done in IPTS-68. As a final step, temperature and
potential temperature were converted to ITS-90 using
t_90 = 0.99976 t_68.

Since November 2001 CTD fluorescence data have been regularly calibrated
against Chlorophyll bottle data and reported in the CTD files as 
Chloropigments (CHLPIG) in microgram/liter (uG/L). Bottle Fluorometric
Chlorophyll-a plus Pheopigments above 175 dbar are matched against the 
upcast CTD Fluorometry to calibrate the downcast Fluorescence reported 
in the CTD files. All CTD files for prior cruises were calibrated and
updated to reflect this change.

Starting HOT-177 (2006), the Transmissometer (XMISS) data that used
to be included in the CTD files have been replaced by continuous Nitrate
measured using Satlantic's InSitu Underwater Spectrometer (ISUS V2).
Satlantic's ISUS V2 is a chemical free sensor that uses UV absorption
technology to provide accurate nitrate concentration measurements in
real-time.


For user convenience, data exist in three forms:


1) in ASCII files, which can be read by all users

Subdirectories below this level (/pub/hot/ctd) contain the ASCII CTD
data grouped according to cruise. Thus, /pub/hot/ctd/hot-1
contains all CTD data from HOT-1. File names are a combination
of cruise, station, and cast numbers in the format hCCaSSNN.ctd
thus, h01a0205.ctd contains data from HOT-1, station 2, cast 5.
      h12a0210.ctd contains data from HOT-12, station 2, cast 10.

Data files from ALOHA-Climax (AC) cruises are in subdirectory ac-#, 
where # is the cruise number. File names for these cruises start with
the prefix a, thus a01a0204.ctd contains data from AC-1, station 2, 
cast 4.


2) as a Unix TAR file, which contains all CTD data from one year,
   and include the .sum files with summary cruise information
   including cast's time and position. 

This file is called year#ctd.tar.Z, where the # is the year number
(i.e. the first year's data is in year1ctd.tar.Z)  This file should 
be copied in binary mode, and then uncompressed with the command: 

    uncompress year1ctd.tar.Z

the data can then be extracted with:

    tar xvf year1ctd.tar

which will create twelve subdirectories, hot-1 to hot-12, each of which
has the CTD data in the format described in 1) above.

3) in ASCII files with depth averaged CTD data from station ALOHA casts.
   Subdirectory aloha_mean below this level (/pub/hot/ctd) contain the
   ASCII files for each cruise. See /pub/hot/ctd/aloha_mean/Readme.aloha_mean
   for details.
