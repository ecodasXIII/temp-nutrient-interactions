              BEACH Water Column Chemical Data Format Document
                              April 11, 2007

                      University of Hawaii at Manoa
                              1000 Pope Road
                         Honolulu, Hawaii  96822


    BEACH water column chemical data are distributed as ASCII flat
files.  An entire cruise's data is contained in one file (e.g., 
hot1.gof contains the data from HOT-1).  Note that these files contain 
all of the chemistry data. The details of the analytical methods used to
determine all of the parameters listed here can be found in the Hawaii Ocean
Time-series Program Data Report(s).

    It should also be noted that both DOC and pH analytical protocols
have changed causing offsets in the the temporal data sets.  The DOC
protocol changed from the persulfate oxidation (HOT 1-27) to the
high-temperature platinum catalyzed oxidation (HOT 44- present).  The
pH was intially analyzed by the electrode method and calibrated against
NBS scale (HOT 23-32), during 1992 the pH was analyzed by the
spectrophotometric method and the pH calculated on the "total scale"
(HOT 33-present).

    For convenience we have also presented some physical data (i.e. CTD
pressure, temperature, salinity, etc ...) in the hot*.gof files.
A complete description of the physical data for each bottle trip
presented in this file can also be found in the appropriate hot*.sea files. 
Please refer to the Readme.water.woce file for the format description of 
those files.

    The files are self-explanatory; one column is written for each measured
parameter.  Missing data are filled with -9. A five-line heading labels each
column.  Variables having asterisks in their heading have a quality flag
associated with them. These quality flags are concatenated as a quality word
which is listed as the last ten variables in each row (six or seven flags 
per variable).  The values each digit can assume and their meanings follows:

Quality Indicators:
	Flag  Meaning
	 1    not quality controled
	 2    good data
	 3    suspect (i.e.  questionable) data
	 4    bad data
	 5    missing data
	 9    variable not measured during this cast

Data Record Format:
	Column  Format	Item
	  1-  8   i6	Station Number
	  9- 16   i3	Cast Number
	 17- 24   i5	Rossette Position
	 25- 32   i5	Replicate Number
	 33- 40 f7.1	CTD Pressure (CTDPRS) [Decibars]
	 41- 48 f7.4	CTD Temperature  CTDTMP) [ITS-90]
	 49- 56 f7.4	CTD Salinity (CTDSAL) [PSS-78]
	 57- 64 f7.1	CTD Oxygen (CTDOXY) [umol/kg]
	 65- 72 f7.4	Potential Temperature (Theta) [ITC-90]
	 73- 80 f6.3	Potential Density (Sigma) [kg/m3]
	 81- 88 f7.4	Bottle Salinity [PSS-78]
	 89- 96 f5.1	Bottle Dissolved Oxygen [umol/kg]
	 97-104 f6.1	Dissolved Inorganic Carbon (DIC) [umol/kg]
	105-112 f6.3	pH [either TOT25 or NBS25]
	113-120   i4	Alkalinity [ueq/kg]
	121-128 f5.2	Partial Pressure of Carbon Dioxide (pCO2) [uatm]
	129-136 f6.2	Phosphate (PO4) [umol/kg]
	137-144 f6.2	Nitrate + Nitrite (NO2+NO3) [umol/kg]
	145-152 f6.2	Silicate (SiO4) [umol/kg]
	153-160 f6.2	Dissolved Organic Phosphorus (DOP) [umol/kg]
	161-168 f6.2	Dissolved Organic Nitrogen (DON) [umol/kg]
	169-176 f7.2	Dissolved Organic Carbon (DOC) [umol/kg]
	177-184	f6.2	Total Dissolved Phosphorus (TDP) [umol/kg]
	185-192	f6.2	Total Dissolved Nitrogen (TDN) [umol/kg]
	193-200 f6.2	Particulate Carbon (PC) [umol/kg]
	201-208 f7.3	Particulate Nitrogen (PN) [umol/kg]
	209-216 f5.1	Particulate Phosphorus (PP) [nmol/kg]
	217-224 f6.1	Low-level Nitrogen (LLN) [nmol/kg]
	225-232 f6.1	Low-level Phosphorus (LLP) [nmol/kg]
	233-240 f6.2	Low-level Silica (LLSi) [umol/kg]
	241-248 f6.2	Fluorometric Chlorophyll a (Chl a.) [ug/l]
	249-256 f6.2	Pheopigments (Pheo) [ug/l]
	257-264 f6.2	HPLC Chlorophyll c3 (Chl c3) [ng/l]
	265-272 f6.2	HPLC Chlorophyll [c1+c2] & Mg 3,8 DVP4A5 (Chl c1+2) [ng/l]
	273-280 f6.2	HPLC Chlorophyll c1 + c2 + c3 (Chl+) [ng/l]
	281-288 f6.2	HPLC Peridinin (Peridino) [ng/l]
	289-296 f6.2	HPLC 19'-Butanoyloxyfucoxanthin (19 But) [ng/l]
	297-304 f6.2	HPLC Fucoxanthin (Fuco) [ng/l]
	305-312 f6.2	HPLC 19'-Hexanoyloxyfucoxanthin (19 Hex) [ng/l]
	313-320 f6.2	HPLC Prasinoxanthin (Prasino) [ng/l]
	321-328 f6.2	HPLC Diadinoxanthin (Diadino) [ng/l]
	329-336 f6.2	HPLC Zeaxanthin (Zeaxan) [ng/l]
	337-344 f6.2	HPLC Chlorophyll b (Chl b) [ng/l]
	345-352 f6.2	HPLC Chlorophyll a (HPLCchl) [ng/l]
	353-360 f6.2	HPLC Chloropyll c4 (Chl c4) [ng/l]
	361-368 f6.2	HPLC Alpha Carotene (A.Car) [ng/l]
	369-376 f6.2	HPLC Beta Carotene (B.Car) [ng/l]
	377-384 f6.2	HPLC Carotenes (caroten) [ng/l]
	385-392 f6.2	HPLC Chlorophyllide a (Chlda a) [ng/l]
	393-400 f6.2	HPLC Violaxanthin (Viol) [ng/l]
	401-408 f6.2	HPLC Lutein (Lutein) [ng/l]
	409-416 f6.2	HPLC Monovinyl Chlorophyll a (MV.Chla) [ng/l]
	417-424 f6.2	HPLC Divinyl Chlorophyll a (DV.Chla) [ng/l]
        425-432 f6.3    Heterotrophic Bacteria (H.Bact) [10**5/ml]
	433-440 f6.3	Prochlorococcus (P.Bact) [10**5/ml]
	441-448	f6.3	Synechococcus (S.Bact) [10**5/ml]
	449-456 f6.3	Eukaryotes (E.bact) [10**5/ml]
	457-464 f6.2	Adenosine 5'-Triphosphate (ATP) [ng/kg]
	465-472 f6.2	Guanosine 5'-Triphosphate (GTP) [ng/kg]
	473-480 f6.2	Hydrogen Peroxide (H2O2) [umol/kg]
	481-488 f6.2	Nitrous Oxide (N2O) [nmol/kg]
	489-496 f6.2	Paticulate Silica (PSi) [nmol/kg]
	497-504 f6.2	Particulate Inorganic Carbon (PIC) [umol/kg]
	505-512 f6.2	Phycoerythrin .4u fraction (PE .4u) [ng/l]
	513-520 f6.2	Phycoerythrin  5u fraction (PE 5u) [ng/l]
	521-528 f6.2	Phycoerythrin 10u fraction (PE 10u) [ng/l]
    	529-536 f6.2	delta-15N of PN (P15N) [permil vs. air-N]
	537-544 f6.2	delta-13C of PC (P13C) [permil vs. VPDB]
	545-552 f6.2	TD700 Chlorophyll a (TD700A) [ug/l]
	553-560 f6.2	TD700 Chlorophyll b (TD700B) [ug/l]
	561-568 f6.2	TD700 Chlorophyll c (TD700C) [ug/l]
	569-576 f6.1	Nitrite (NO2) [nmol/kg]
	577-584 f6.3	Spectrophotometric Silicate (SPEC.SI) [umol/kg]
	587-593   a7	Quality flags for CTD Salinity - Alkalinity
	595-601   a7	Quality flags for pCO2 - DOC
	603-609   a7	Quality flags for TDP - LLP
	611-617   a7	Quality flags for LLSi - Perid
	619-625   a7	Quality flags for 19.But - Chl.b
	628-633   a6	Quality flags for HPLCchl - Chlda.a
	636-641   a6	Quality flags for Viol - P.Bact
	644-649   a6	Quality flags for S.Bact - N2O
	652-657   a6	Quality flags for PSi - P15N
	660-665   a6	Quality flags for P13C - Spec.Si
