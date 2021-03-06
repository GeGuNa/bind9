# SPDX-License-Identifier: FSFAP
#
# AX_POSIX_SHELL
# -------------
# Check for a POSIX-compatible shell.
#
# LICENSE
#
#   Copyright (c) 2021 Internet Systems Consortium
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

AC_DEFUN([AX_POSIX_SHELL],
	 [AC_CACHE_CHECK([for a POSIX-compatible shell], [ac_cv_prog_shell],
			 [ac_test_shell_script='
			  test "$(expr 1 + 1)" = "2" &&
			  test "$(( 1 + 1 ))" = "2"
			  '

			  for ac_cv_prog_shell in \
			    "$CONFIG_SHELL" "$SHELL" /bin/sh /bin/bash /bin/ksh /bin/sh5 no; do
			    AS_CASE([$ac_cv_prog_shell],
				    [/*],[
				      AS_IF(["$ac_cv_prog_shell" -c "$ac_test_shell_script" 2>/dev/null],
					    [break])
				    ])
			  done
			 ])
	  AS_IF([test "$ac_cv_prog_shell" = "no"],
		[SHELL=/bin/sh
		 AC_MSG_WARN([using $SHELL, even though it does not conform to POSIX])
		],
		[SHELL="$ac_cv_prog_shell"
		])
	  AC_SUBST([SHELL])
	 ])
