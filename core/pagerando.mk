
# Clear the internal variables, to make multilib builds work
LOCAL_PAGERANDO_MODULE_SUFFIX:=
LOCAL_PAGERANDO_INTERMEDIATES_SUFFIX:=
LOCAL_PAGERANDO_SHARED_SUFFIX:=
LOCAL_PAGERANDO_STATIC_SUFFIX:=

my_pagerando :=
ifndef LOCAL_IS_HOST_MODULE
  my_pagerando := $(strip $(LOCAL_PAGERANDO))
  ifdef LOCAL_PAGERANDO_$(my_32_64_bit_suffix)
  my_pagerando := $(strip $(LOCAL_PAGERANDO_$(my_32_64_bit_suffix)))
  endif
  ifdef LOCAL_PAGERANDO_$(TARGET_$(LOCAL_2ND_ARCH_VAR_PREFIX)ARCH)
  my_pagerando := $(strip $(LOCAL_PAGERANDO_$(TARGET_$(LOCAL_2ND_ARCH_VAR_PREFIX)ARCH)))
  endif
  ifeq ($(PAGERANDO)|$(my_pagerando),true|)
    my_pagerando := true
  endif
endif

ifneq ($($(LOCAL_2ND_ARCH_VAR_PREFIX)TARGET_SUPPORTS_PAGERANDO),true)
  my_pagerando := false
endif

# Pagerando should only be enabled for static and shared libraries
is_library := false
ifeq (SHARED_LIBRARIES,$(LOCAL_MODULE_CLASS))
  is_library := true
endif
ifeq (STATIC_LIBRARIES,$(LOCAL_MODULE_CLASS))
  is_library := true
endif
ifneq ($(is_library),true)
  my_pagerando := false
endif
