extends Node

var sdir = "res://media/schemes/"
var sname = null
var smax=null
var s=-1
var sdef = load("res://media/ui/default_scheme.png")
var ssuf=null

#nodes
var snode = null
#nodes for popup
var popnode = null
var popscheme = null
var storenode = null
var schemestore = null
var schemestored = []
var storepos= null
var schemeerror = null

var scheme_decks=null

func _ready():
	sname = snames()
	scheme_deck_find()

func snames():
	var sfiles = []
	var dir = Directory.new()
	dir.open(sdir)
	dir.list_dir_begin()

	while true:
		var nfile=null
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not file.ends_with(".import"):
			nfile=file.replace(".png","")
			sfiles.append(nfile)

	dir.list_dir_end()

	return sfiles
	
func s_cycle():
	if ongoing(ssuf[s]):
		store()
	else:
		if s==smax:
			s=0
		else:
			s=s+1
		snode.set_normal_texture(load(sdir+sname[ssuf[s]]+".png"))
	global.splay(global.scard)
func s_new():
	s=0
	randomize()
	ssuf.shuffle()
	snode.set_normal_texture(load(sdir+sname[ssuf[s]]+".png"))
	global.splay(global.scard)

func ongoing(check):
	var test = sname[check]
	var test2 =["i-bask-in-your-silent-awe","i-know-all-i-see-all","imprison-this-insolent-wretch","my-undead-horde-awakens","nature-shields-its-own","nothing-can-stop-me-now","the-very-soil-shall-shake","your-inescapable-doom"]
	var bo = null
	
	if test2.find(test) > -1:
		bo = true
	else:
		bo = false
	return bo

# warning-ignore:unused_argument
func store():
	if schemestored.size()==16:
		schemeerror.popup()
	else:
		var scheme_no = ssuf[s]
		schemestored.append(scheme_no)
		
		for i in schemestored.size():
			schemestore[i].set_normal_texture(load(sdir+sname[schemestored[i]]+".png"))
		
		ssuf.remove(s)
		smax = ssuf.size()-1
		if s>smax: 
			s=0
		snode.set_normal_texture(load(sdir+sname[ssuf[s]]+".png"))
func store_popup(pos):
	if schemestored.size()>pos:
		storepos=pos
		popscheme.set_texture(load(sdir+sname[schemestored[pos]]+".png"))
	
		popnode.popup()
	global.splay(global.sback)
func unstore():
	var scheme_no=schemestored[storepos]
	ssuf.insert(s,scheme_no)
	print(smax)
	smax = ssuf.size()-1
	print(smax)
	s=s+1
	
	for i in 16:
		schemestore[i].set_normal_texture(sdef)
	
	schemestored.remove(storepos)
	for i in schemestored.size():
		schemestore[i].set_normal_texture(load(sdir+sname[schemestored[i]]+".png"))
	
	popnode.hide()
	global.splay(global.sback)

#deck operations
func scheme_deck_find():
	scheme_decks = []
	var dir = Directory.new()
	if not dir.open('user://decks') == OK:
		dir.make_dir('user://decks')
		dir.open('user://decks')
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.ends_with(".deck"):
			file.replace(".deck","")
			scheme_decks.append(file)
	dir.list_dir_end()
	
	if scheme_decks.find("default") == -1:
		ssuf=[]
		for i in range(sname.size()):
			ssuf.append(i)
		scheme_deck_save("default")
		scheme_decks.insert(0,"default")
		smax=ssuf.size()-1
	else:
		var dno = scheme_decks.find("default")
		scheme_decks.remove(dno)
		scheme_decks.insert(0,"default")

func scheme_deck_load(deckname):
	ssuf=[]
	var file = File.new()
	file.open(str("user://decks/"+deckname+".deck"), File.READ)
	while true:
		var sdname= file.get_line()
		if sdname =="":
			break
		else:
			if not sname.find(sdname) ==-1:
				ssuf.append(sname.find(sdname))
	file.close()
	smax=ssuf.size()-1

func scheme_deck_save(deckname):
	var file = File.new()
	file.open("user://decks/"+deckname+".deck", File.WRITE)
	ssuf.sort()
	for i in range(ssuf.size()):
		file.store_line(sname[ssuf[i]])
	file.close()
