/* Copyright (C) 1999 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Jakub Jelinek <jj@ultra.linux.cz>, 1999.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */


#include <sys/syscall.h>

.text;  
.global	wait4;
.align 4;
.type	wait4,@function;

wait4:	 
     mov  __NR_wait4, %g1
     ta  0x10
     bcs  9000f
     nop
     retl
     nop
9000:	
	save    %sp,-96,%sp
	call __errno_location
	nop
	st	%i0,[%o0]
	jmpl	%i7+8,%g0
	restore	%g0,-1,%o0
	
.size wait4,.-wait4;
