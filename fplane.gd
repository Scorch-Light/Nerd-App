extends Node

var pdir = "res://media/planes/"
var pname = null
var pmax=null
var p=-1
var pdef = load("res://media/ui/default_plane.png")
var psuf=null

var dchaos=0

var pnode = null
var dnode = null

#popup nodes
var poolpop =null
var poolpop1 =null
var poolpop2 =null
var poolpop3 =null
var poolpopbig=null

var p1 = null
var p2 =null
var p3 =null


func _ready():
	pname = pnames()
	pmax = (pname.size()-1)
	#print(pmax)
	psuf=[]
	for i in range(pmax+1):
		psuf.append(i)

func pnames():
	var pfiles = []
	var dir = Directory.new()
	dir.open(pdir)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not file.ends_with(".import"):
			pfiles.append(file)
			pfiles.sort()

	dir.list_dir_end()

	return pfiles

func p_dice():
	if p == -1:
		p_new()
	elif phenom(psuf[p]) == 1:
		p_cycle()
	elif phenom(psuf[p]) == 2: #not ready yet
		p_cycle()
	else:
		global.splay(global.sdice)
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var d=rng.randi_range(1,6)
		
		if d ==6:
			print("Die: " + str(d) +" Planeswalk" )
			dnode.set_button_icon(load("res://media/ui/walk.png"))
			global.splay(global.swalk)
			fplane.p_cycle()
		elif dchaos == 1 or d==5:
			print("Die: " + str(d) +" Chaos")
			dnode.set_button_icon(load("res://media/ui/chaos.png"))
			global.splay(global.schaos)
			if chaos(p)==true:
				pop_chaos()
		else:
			print("Die: " + str(d) +" Blank")
			dnode.set_button_icon(load("res://media/ui/empty.png"))

func p_cycle():
	dchaos = 0
	
	if pname[psuf[p]] == "chaotic-aether.png": 
		dchaos=1
		
	if p==pmax:
		p=0
	else:
		p=p+1
		
	if phenom(psuf[p]) == 2: # temp bypass 
		print("Bypassed P: "+ str(p) +" "+ psuf[p] )
		p_cycle() #temp
	else:
		pnode.set_texture(load(pdir+pname[psuf[p]]))
		print("P: " + str(p))
func p_new():
	p=0
	dchaos=0
	randomize()
	psuf.shuffle()
#
#	testcard("chaotic-aether.png" ,1)
#	testcard("pools-of-becoming.png" ,2)
#	testcard("interplanar-tunnel.png" ,3)
#
#
	pnode.set_texture(load(pdir+pname[psuf[p]]))
	global.splay(global.scard)
	#Canot start with Phenomenom
	if phenom(psuf[p]) > 0:
		print("Phenom Skipped")
		p_new()

func phenom(check):
	var test = pname[check]
	var basic =["morphic-tide.png","mutual-epiphany.png","planewide-disater.png","reality-shaping.png","time-distortion.png","chaotic-aether.png"]
	var advanced =["interplanar-tunnel.png","spatial-merging.png"]
	var bo = null
	
	if basic.find(test) >(-1):
		bo = 1
	elif advanced.find(test)>(-1):
		bo = 2
	else:
		bo = 0
	return bo

func chaos(check):
	var test = pname[psuf[check]]
	var test2 =["pools-of-becoming.png"]
	var bo = null
	
	if test2.find(test) > (-1):
		bo = true
	else:
		bo = false
	print(bo)
	return bo

func pop_chaos():
	if pname[psuf[p]] == "pools-of-becoming.png":
		if p==pmax:
			p1 = 0
			p2 = 1
			p3 = 2
		else:
			p1 = p+1
			p2 = p+2
			p3 = p+3
		
		poolpop1.set_normal_texture(load(pdir+pname[psuf[p1]]))
		poolpop2.set_normal_texture(load(pdir+pname[psuf[p2]]))
		poolpop3.set_normal_texture(load(pdir+pname[psuf[p3]]))
		poolpopbig.set_texture(load(pdir+pname[psuf[p1]]))
		poolpop.popup()

func pop_chaos_close():
	var suf_swap = psuf[p3]
	psuf[p3] = psuf[p]
	psuf[p]=suf_swap
	p=p3
	pnode.set_texture(load(pdir+pname[psuf[p]]))
	poolpop.hide()
	global.splay(global.sback)

func pop_chaos_button(button):
	if button ==1:
		poolpopbig.set_texture(load(pdir+pname[psuf[p1]]))
	elif button==2:
		poolpopbig.set_texture(load(pdir+pname[psuf[p2]]))
	elif button==3:
		poolpopbig.set_texture(load(pdir+pname[psuf[p3]]))
	
	global.splay(global.scard)

func testcard(card,pos):
	var name_no = pname.find(card)
	var suf_no = psuf.find(name_no)
	var suf_swap = psuf[pos]
	psuf[pos] = name_no
	psuf[suf_no]=suf_swap
