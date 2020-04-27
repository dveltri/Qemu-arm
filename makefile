################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include ParTest/subdir.mk
-include FreeRTOS_Kernel/subdir.mk
-include FreeRTOS_Kernel/portable/MemMang/subdir.mk
-include FreeRTOS_Kernel/portable/GCC/Posix/subdir.mk
-include FileIO/subdir.mk
-include Common_Demo/Minimal/subdir.mk
-include Common_Demo/Full/subdir.mk
-include AsyncIO/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: FreeRTOS_Posix

# Tool invocations
FreeRTOS_Posix: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C Linker'
	gcc -pthread -o"FreeRTOS_Posix" $(OBJS) $(USER_OBJS) $(LIBS) -lrt
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) FreeRTOS_Posix
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
