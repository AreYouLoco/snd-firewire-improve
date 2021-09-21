obj-m += sound/firewire/

ifndef KERNELRELEASE
KERNELRELEASE := $(shell uname -r)
endif

KDIR := /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

#force to build all modules
export CONFIG_SND_FIREWIRE_LIB=m
export CONFIG_SND_DICE=n
export CONFIG_SND_ISIGHT=n
export CONFIG_SND_BEBOB=n
export CONFIG_SND_FIREWORKS=m
export CONFIG_SND_OXFW=m
export CONFIG_SND_FIREWIRE_DIGI00X=n
export CONFIG_SND_FIREWIRE_TASCAM=n
export CONFIG_SND_FIREWIRE_MOTU=n
export CONFIG_SND_FIREFACE=m

all:
	$(MAKE) W=1 -C $(KDIR) M=$(PWD) modules

check: clean
	$(MAKE) W=1 C=1 CF=-D__CHECK_ENDIAN__ -C $(KDIR) M=$(PWD) modules

install:
	$(MAKE) W=1 -C $(KDIR) M=$(PWD) modules_install

clean:
	$(MAKE) W=1 -C $(KDIR) M=$(PWD) clean
