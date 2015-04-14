#! /usr/bin/gawk -f

# read list of stations from stngen.stns file calculate time to traverse
# them allowing for a speed SPD
# nominally 10 knots

BEGIN{	
	# default ship speed 
	if (SPD==""){SPD=10}
	# default time on station
	if (TimeOnStation==""){TimeOnStation=0}
	print "# Using speed " SPD " knots" 
	started=0
	TotalDist=0
	TotalTime=0
	Dist=0
	Time=0
	}

!/^#/{	
	p0x=$1
	p0y=$2
	}
started{
	 # distance in nautical miles
	 Dist=distance(p0y,p0x,p1y,p1x,"nm")
	 # time in hours
	 Time=Dist/SPD 
# 
# calculate station time
# TimeOnStation=Bathy+Bottles+DeployRecover
# Add in station time
	 Time+=TimeOnStation
# 
	 TotalDist+=Dist
	 TotalTime+=Time
	 p1x=p0x
	 p1y=p0y

	}

!/^#/{	
	if (!started) {
	 	p1x=p0x
	 	p1y=p0y
		started=1
		}
	# print $0 "\t" round(Dist*100)/100 "\t" round(TotalDist*100)/100 "\t" Time "\t" TotalTime/24
	printf "%s\t%.2f\t%.2f\t%.2f\t%.2f\n",$0,round(Dist*100)/100 , round(TotalDist*100)/100 , Time , TotalTime/24
	}

# don't do this
# END{print TotalDist}


# ## Station Listing
# ## Station Lines are identified by a line with 
# ## "Line" LineName CentrePos CoastPnt
# ## Station positions are identified by a line with 
# ## Longitude Latitude DistFromCoast Depth StationNumber StationLabel
# # Line GG 	16.4493379031/-28.7999988356	16.5622387944/-28.7537969192
# 16.4243	-28.8101	 14.8	   64	 1	GG1
# 16.4071	-28.8171	 16.7	   79	 2	GG2
# 16.3898	-28.8241	 18.5	   91	 3	GG3
# 16.3726	-28.8311	 20.4	  101	 4	GG4
# 
# 
# awk '
# distance
# 
# 
# linelimits.awk
# plan.s
# README.md
# stngen_0.ps
# stngen_-1.stns
# stngen.coast
# stngen.ps
# stngen.stns
# stngen.zsh

# vim:se nowrap tw=0 :
