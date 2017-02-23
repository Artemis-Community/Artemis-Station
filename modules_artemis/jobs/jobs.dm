//Department Flags FUCK BITSHIFTS!! ~rj
var/const/CIVILIAN 			= "CIV"
var/const/CAPTAIN			= "CAP"
var/const/HOP				= "HOP"
var/const/IAA				= "IAA"
var/const/BARTENDER			= "BAR"
var/const/BOTANIST			= "BOT"
var/const/COOK				= "COO"
var/const/JANITOR			= "JAN"
var/const/LIBRARIAN			= "LIB"
var/const/CHAPLAIN			= "CHA"
var/const/ASSISTANT			= "ASS" //Good god RJ, always with the asses. ~Cakey
var/const/MIME				= "MIM"
var/const/CLOWN				= "CLO"

var/const/ENG 				= "ENG"
var/const/CHIEF				= "CHI"
var/const/SENIORENGINEER	= "SEE"
var/const/ENGINEER			= "ENG"


var/const/SEC 				= "SEC"
var/const/HOS				= "HOS"
var/const/WARDEN			= "WAR"
var/const/DETECTIVE			= "DET"
var/const/OFFICER			= "OFF"


var/const/CARGO 			= "CAR"
var/const/QUARTERMASTER		= "QUA"
var/const/FOREMAN			= "FOR"
var/const/CARGOTECH			= "CAR"
var/const/MINER				= "MIN"


var/const/MED 				= "MED"
var/const/CMO				= "CMO"
var/const/SENIORDOCTOR		= "SED"
var/const/DOCTOR			= "DOC"


var/const/SCI 				= "SCI"
var/const/RD				= "SRD"
var/const/SENIORSCIENTIST	= "SES"
var/const/SCIENTIST			= "SCI"


var/const/SOLGOV 			= "SOL"
var/const/SOLGOVAGENT		= "SOA"

var/const/SILICON 			= "SIL"
var/const/AI				= "SAI"
var/const/CYBORG			= "CYB"

//Unused, but here for error-free compiling(tm) ~Cakey
var/const/ENGSEC			= "ENGSEC"

var/const/ATMOSTECH			= "ATMOS"
var/const/ROBOTICIST		= "ROBO"

var/const/MEDSCI			= "MEDSCI"

var/const/GENETICIST		= "GENE"
var/const/VIROLOGIST		= "VIRO"
var/const/CHEMIST			= "CHEM"

var/const/LAWYER			= "LAW"

/proc/guest_jobbans(job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))


//this is necessary because antags happen before job datums are handed out, but NOT before they come into existence
//so I can't simply use job datum.department_head straight from the mind datum, laaaaame.
/proc/get_department_heads(var/job_title)
	if(!job_title)
		return list()

	for(var/datum/job/J in SSjob.occupations)
		if(J.title == job_title)
			return J.department_head //this is a list

//Promotions system
var/list/allJobDatums

var/static/regex/cap_expand = new("cap(?!tain)")
var/static/regex/cmo_expand = new("cmo")
var/static/regex/hos_expand = new("hos")
var/static/regex/hop_expand = new("hop")
var/static/regex/rd_expand = new("rd")
var/static/regex/ce_expand = new("ce")
var/static/regex/qm_expand = new("qm")
var/static/regex/sec_expand = new("(?<!security )officer")
var/static/regex/engi_expand = new("(?<!station )engineer")
var/static/regex/atmos_expand = new("atmos tech")
var/static/regex/doc_expand = new("(?<!medical )doctor|medic(?!al)")
var/static/regex/mine_expand = new("(?<!shaft )miner")
var/static/regex/chef_expand = new("chef")
var/static/regex/borg_expand = new("(?<!cy)borg")

/proc/get_full_job_name(job)
	job = lowertext(job)
	job = cap_expand.Replace(job, "captain")
	job = cmo_expand.Replace(job, "chief medical officer")
	job = hos_expand.Replace(job, "head of security")
	job = hop_expand.Replace(job, "head of personnel")
	job = rd_expand.Replace(job, "research director")
	job = ce_expand.Replace(job, "chief engineer")
	job = qm_expand.Replace(job, "quartermaster")
	job = sec_expand.Replace(job, "security officer")
	job = engi_expand.Replace(job, "station engineer")
	job = atmos_expand.Replace(job, "atmospheric technician")
	job = doc_expand.Replace(job, "medical doctor")
	job = mine_expand.Replace(job, "shaft miner")
	job = chef_expand.Replace(job, "cook")
	job = borg_expand.Replace(job, "cyborg")
	return job