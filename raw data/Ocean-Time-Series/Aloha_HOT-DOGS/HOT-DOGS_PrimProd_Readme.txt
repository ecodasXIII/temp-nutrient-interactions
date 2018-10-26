                 BEACH Primary Production Format Document
                               May 11, 2018

                      University of Hawaii at Manoa
                           1950 East-West Road
                         Honolulu, Hawaii  96822


    BEACH primary production data are distributed as an ASCII flat
file.  An entire year's data is contained in one file (e.g., 
hot1-12.pp contains the data from HOT-1 through HOT-12).  The files
are self-explanatory and are presented in a format similar to the one
in the Hawaii Ocean Time-series Program Data Report 1.

    A four-line heading labels each column.  Missing data are filled 
with -9. The last column is quality flags for the bottle, chlorophyll, 
pheopigments, light incubation, dark incubation, salinity & bacteria
values respectively.

Quality Indicators:
	Flag  Meaning
	 1    unquality controlled
	 2    good data
	 3    suspect (i.e.  questionable) data
	 4    bad data
	 5    missing value
	 9    variable not measured during this cast
	 
	 
Reasons for suspect bottle:  data indicates mistrip or slight leaking
Reasons for bad bottle:      known mistrip or heavy leaking

Reasons for suspect data:    subjectively determined by analyst
Reasons for bad data:        sampling or analytical error


Data Record Format:
	Column  Format	Item
	  2-  5   i4	Cruise Number
	 10- 10   a1	O - GO-FLO sampled, on-deck Incubation.
	                I - GO-FLO sampled, in-situ Incubation.
	                R - Rosette sampled, in-situ Incubation.
	                N - External closing niskin sampled, in-situ Incubation.
	 14- 18 f5.2	Incubation Time (hours)
	 21- 26   i6	Date (YYMMDD)
	 29- 32   i4	Start Time (HHMM)
	 35- 38   i4	End Time (HHMM)
	 40- 43   i4	Depth (Meters)
	 45- 50 f6.3	Chlorophyll a. Mean (mg/m3)
	 52- 57 f6.3	Chlroropyll a. Standard Deviation (mg/m3)
	 59- 64 f6.3	Pheopigments Mean (mg/m3)
	 66- 71 f6.3	Pheopigments Standard Deviation (mg/m3)
         74- 79 f6.2    Light - replicate #1 (mg C/m3)
         82- 87 f6.2    Light - replicate #2 (mg C/m3)
         90- 95 f6.2    Light - replicate #3 (mg C/m3)
         98-103 f6.2    Dark - replicate #1 (mg C/m3)
        106-111 f6.2    Dark - replicate #2 (mg C/m3)
        114-119 f6.2    Dark - replicate #3 (mg C/m3)
        122-128 f7.4    Salinity (PSS-78)
        130-136   i7    Prochlorococcus (#/ml)
        138-144   i7    Heterotrophic Bacteria (#/ml)
        146-152   i7    Synechococcus (#/ml)
        154-160   i7    Eukaryotes (#/ml)
        163-172  i10    Quality Flags
