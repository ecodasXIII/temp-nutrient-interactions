                          CTD Data Format Document

                              June 18, 2008


    CTD data are distributed in a format specified by the international
WOCE Hydrographic Programme Office (WHPO).  This document describes 
that format.

    Each station/cast is stored in a separate file.  A file's name can be
determined by the concatenation of 'h', 3 digit cruise number, 'a', a 2 digit
station number, a 2 digit cast number and a file extension of ctd.  For ex-
ample, HOT-1, station 2, cast 3, would be found in h01a0203.ctd.

    The cruise and position information for each cast is in the cruise
summary file (*.sum).  The EXPOCODE, station number and cast number
can be used to cross-reference the CTD data files with the cruise
summary file.  This code allows for the identification of the cruise.
It consists of a 4 character NODC country-ship code, a maximum of 8
character cruise number followed by a "/" and leg number.  For example,
the EXPOCODE for HOT-13 on the R/V Moana Wave would be 31MW013/1.

    The CTD data file has a fixed record length of 65 characters / record. 
The first six records of a CTD file contain header information:

    Record 1:
       Column  Format	Item
         9-22     a14   EXPOCODE (KA=Kaimalino,WE=Wecoma,MW=Moana Wave)
        31-34     a4    WHP station identification
        41-42     i2	Month
        43-44     i2	Day
        45-46     i2	Year
        FORTRAN FORMAT  (8x,a14,8x,a4,6x,3i2)
        C               "%*s %s %*s %s %*s %2d%2d%2d"

    Record 2:
         7-12     a6	Station number
        20-22     i3	Cast number
        36-40     i5	Number of data records in the file
        FORTRAN FORMAT  (6x,a6,7x,i3,13x,i5)
        C               "%*s %d %*s %d %*s %d"

    Record 3:
        16-21     i6    Instrument number
        37-41    f5.2	Sampling rate (hz)
        FORTRAN FORMAT  (15x,i6,15x,f5.2)
        C               "%*s %d %*s %f"

    Record 4:
        Headers for data columns (variable labels).
        
    Record 5:
        Unit header for data columns.
        
    Record 6:
        Quality byte designators.  All columns requiring a quality
        byte are underscored by seven asterisks.
                

     The remaining records contain CTD data. The order of variables in a
record are as follows: pressure, temperature, salinity, oxygen, trans-
mission, chloropigments and quality.  Missing values are flagged with -99.0.
Starting on HOT-177 (2006), the transmission have been replaced by continuous
Nitrate data (see Readme.ctd).

   Data Record Format:

        Column	Format	Item
	 1-8	f8.1 	Pressure (Decibars)
	 9-16	f8.4 	Temperature (Degrees Celsius,
                           International Temperature Scale of 1990)
	17-25	f9.4	Salinity (1978 International Practical Salinity Scale)
	26-33	f8.1	Oxygen (micromoles per kilogram)
	34-41   f8.3    Transmission (% transmission), Nitrate (micromoles per
                        kilogram) after HOT-176
	42-49   f8.3    Chloropigments (microgram/liter)
	50-57    i8     Number of observations averaged at this pressure level
	58-65	 i8     Quality (defined by investigator) **
	FORTRAN FORMAT  (f8.1, f8.4, f9.4, f8.1, 2f8.3, i8, i8)
	C               "%f %f %f %f %f %f %d %d"


**  The quality word is the left-to-right concatenation of required quality bytes 
for the variables measured.  They are defined as follows:

 byte value  Definition
     1       Not calibrated with water samples.
     2       Acceptable measurement.
     3       Questionable measurement.
     4       Bad measurement.
     5       Not reported.
     6       Interpolated value.
     7       Not assigned for CTD data
     8       Not assigned for CTD data
     9       Not sampled

Sample File: (First and last few records)

EXPOCODE     31MW013/1 WHP-ID PRS2 DATE 010790                  1
STNNBR     1 CASTNO  2 NO. RECORDS=  512                        2
INSTRUMENT NO.  91361 SAMPLING RATE 24.00 HZ                    3
  CTDPRS  CTDTMP   CTDSAL  CTDOXY   XMISS   FLUOR  NUMBER  QUALT1
    DBAR   DEG C   PSS-78 UMOL/KG  %TRANS  WT/CM2    OBS.       *
 ******* *******  ******* ******* ******* *******               *
     0.0 25.0409  34.9405   -99.0 -99.000   0.008      36  222992
     2.0 25.0391  34.9409   -99.0 -99.000   0.008     204  222992
     4.0 25.0381  34.9411   -99.0 -99.000   0.008      84  222992
     6.0 25.0379  34.9412   -99.0 -99.000   0.008      36  222992

  1004.0  3.8761  34.5064   -99.0 -99.000   0.009      60  222992
  1006.0  3.8740  34.5063   -99.0 -99.000   0.009      60  222992
  1008.0  3.8729  34.5065   -99.0 -99.000   0.009      48  222992
  1010.0  3.8719  34.5064   -99.0 -99.000   0.009      96  222992
  1012.0  3.8726  34.5064   -99.0 -99.000   0.010      60  222992
  1014.0  3.8721  34.5064   -99.0 -99.000   0.009      60  222992
  1016.0  3.8715  34.5065   -99.0 -99.000   0.009      84  222992
  1018.0  3.8700  34.5066   -99.0 -99.000   0.009      60  222992
  1020.0  3.8700  34.5066   -99.0 -99.000   0.009     180  222992
  1022.0  3.8705  34.5066   -99.0 -99.000   0.009     477  222992
