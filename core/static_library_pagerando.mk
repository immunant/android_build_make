
include $(BUILD_SYSTEM)/pagerando.mk

ifeq ($(my_pagerando),true)
LOCAL_PAGERANDO_SHARED_SUFFIX := _pagerando
endif

include $(BUILD_SYSTEM)/static_library_internal.mk

ifeq ($(my_pagerando),true)

LOCAL_ENABLE_PAGERANDO := true
LOCAL_PAGERANDO_MODULE_SUFFIX := _pagerando
LOCAL_PAGERANDO_INTERMEDIATES_SUFFIX := _pagerando
LOCAL_PAGERANDO_STATIC_SUFFIX := _pagerando

# Clear all the variables from the non-pagerando build
OVERRIDE_BUILT_MODULE_PATH :=
LOCAL_BUILT_MODULE :=
LOCAL_INSTALLED_MODULE :=
LOCAL_MODULE_STEM :=
LOCAL_BUILT_MODULE_STEM :=
LOCAL_INSTALLED_MODULE_STEM :=
LOCAL_INTERMEDIATE_TARGETS :=

include $(BUILD_SYSTEM)/static_library_internal.mk

endif
