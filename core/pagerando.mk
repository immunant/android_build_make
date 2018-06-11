
# Clear the internal variables, to make multilib builds work
LOCAL_PAGERANDO_MODULE_SUFFIX:=
LOCAL_PAGERANDO_INTERMEDIATES_SUFFIX:=
LOCAL_PAGERANDO_SHARED_SUFFIX:=
LOCAL_PAGERANDO_STATIC_SUFFIX:=

ifndef LOCAL_IS_HOST_MODULE
  LOCAL_PAGERANDO := $(strip $(LOCAL_PAGERANDO))
  ifdef LOCAL_PAGERANDO_$(my_32_64_bit_suffix)
  LOCAL_PAGERANDO := $(strip $(LOCAL_PAGERANDO_$(my_32_64_bit_suffix)))
  endif
  ifdef LOCAL_PAGERANDO_$(TARGET_$(LOCAL_2ND_ARCH_VAR_PREFIX)ARCH)
  LOCAL_PAGERANDO := $(strip $(LOCAL_PAGERANDO_$(TARGET_$(LOCAL_2ND_ARCH_VAR_PREFIX)ARCH)))
  endif
  ifeq ($(PAGERANDO)|$(LOCAL_PAGERANDO),true|)
    LOCAL_PAGERANDO := true
  endif
endif

ifneq ($($(LOCAL_2ND_ARCH_VAR_PREFIX)TARGET_SUPPORTS_PAGERANDO),true)
  LOCAL_PAGERANDO := false
endif
