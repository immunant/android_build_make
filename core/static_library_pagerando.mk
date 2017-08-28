# We need to build a pagerando version of the library in case any pagerando
# binaries need this static library
include $(BUILD_SYSTEM)/pagerando.mk
ifeq ($(my_pagerando),true)

LOCAL_PAGERANDO_MODULE_SUFFIX := _pagerando
LOCAL_PAGERANDO_INTERMEDIATES_SUFFIX := _pagerando
LOCAL_PAGERANDO_STATIC_SUFFIX := _pagerando

include $(BUILD_SYSTEM)/static_library_internal.mk

# Clear build variables to set up for non-pagerando build
OVERRIDE_BUILT_MODULE_PATH :=
LOCAL_BUILT_MODULE :=
LOCAL_INSTALLED_MODULE :=
LOCAL_MODULE_STEM :=
LOCAL_BUILT_MODULE_STEM :=
LOCAL_INSTALLED_MODULE_STEM :=
LOCAL_INTERMEDIATE_TARGETS :=

endif

# Also build a non-pagerando static library for use in non-pagerando binaries
LOCAL_PAGERANDO := false
include $(BUILD_SYSTEM)/static_library_internal.mk
