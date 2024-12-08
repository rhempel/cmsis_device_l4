# ----------------------------------------------------------------------------
# cmsis_device_l4 library makefile
# ----------------------------------------------------------------------------

MODULE := cmsis_device_l4

MODULE_PATH := $(call make_current_module_path)
# $(info MODULE_PATH is $(MODULE_PATH))

$(MODULE)_PATH := $(MODULE_PATH)
# $(info $(MODULE)_PATH is $($(MODULE)_PATH))

# ----------------------------------------------------------------------------
# Source file lists go here, C dependencies are automatically generated
# by the compiler using the -m option
#
# You can set up a common source path late in the file
#
# Note that each module gets its own, privately scoped variable for building
# ----------------------------------------------------------------------------

# We need both else a previous definition is used :-) Can we make this an include?

SRC_C :=  
SRC_ASM :=  

SRC_C += Source/Templates/system_$(MCU_FAMILY).c

$(MODULE)_startup_VARIANT := $(shell echo $(MCU_VARIANT) | tr '[:upper:]' '[:lower:]')

SRC_ASM += Source/Templates/gcc/startup_$($(MODULE)_startup_VARIANT).s

SYSTEM_STARTUP_OBJ := $(BUILD_PATH)/$(MODULE_PATH)/Source/Templates/gcc/startup_$($(MODULE)_startup_VARIANT).o

# ----------------------------------------------------------------------------
# Set up the module level include path

$(MODULE)_INCPATH :=
$(MODULE)_INCPATH += $(MODULE_PATH)/Include
$(MODULE)_INCPATH += $(cmsis_core_PATH)/Include

# ----------------------------------------------------------------------------
# Set any module level compile time defaults here

$(MODULE)_CDEFS :=
$(MODULE)_CDEFS +=

# ----------------------------------------------------------------------------
# Include the adaptabuild library makefile - must be done for each module!

include $(ADAPTABUILD_PATH)/make/library.mak

# ----------------------------------------------------------------------------
