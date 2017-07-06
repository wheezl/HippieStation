//Loadout. There are 2 existing datums: Category datums and Loadout Items datums.
//Category datums have name and gear list, the former has to be set, the latter gets filled in STILLTOBEDECIDED
//Loadout Items have several vars that need to be set.

GLOBAL_LIST_EMPTY(loadout_items)

/proc/initialize_global_loadout_items()
	LAZYINITLIST(GLOB.loadout_items)
	for(var/item in subtypesof(/datum/gear))
		var/datum/gear/I = new item()
		if(!GLOB.loadout_items[slot_to_string(I.category)])
			LAZYINITLIST(GLOB.loadout_items[slot_to_string(I.category)])
		LAZYSET(GLOB.loadout_items[slot_to_string(I.category)], I.name, I)


/datum/gear
	var/name = "gear name"
	var/category = "none"
	var/description = "why do i exist"
	var/path //item-to-spawn path
	var/cost = 1 //normally, each loadout costs a single point.
	var/list/restricted_roles // use LAZYADD in Initialize() and add the roles your item is locked to

/datum/gear/New()
	..()
	if(!description && path)
		var/obj/O = path
		description = initial(O.desc)

/datum/gear/test
	name = "fuck you"
	description = "i'm cool"
	category = slot_head

/datum/gear/test2
	name = "fuck you2"
	description = "i'm cool2"
	category = slot_back
	path = /obj/item/weapon/storage/backpack/clown