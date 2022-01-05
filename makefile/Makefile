none:
	@grep '####' Makefile | grep -v grep | sed -e 's/####//'
one: #### Target one
	@echo one
two: #### Target two
	@echo two

# first line is targets
#   					second line like this is rules
# in above function we have used grep will search for #### lines and anothere gre -v will removes grep in that commanf
# sed means stream editor in linux used for searching,find,replace.insertion and deletion
# "sed /s - s means starting of sed and first #### will get replaced by empty."