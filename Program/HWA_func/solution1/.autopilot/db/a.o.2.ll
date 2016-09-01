; ModuleID = 'C:/Temp/RC/HWA_func/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=20 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=5 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [19 x i8] c"-bus_bundle hwa_io\00", align 1 ; [#uses=5 type=[19 x i8]*]
@str = internal constant [9 x i8] c"HWA_func\00"  ; [#uses=1 type=[9 x i8]*]

; [#uses=0]
define void @HWA_func(i32 %x, i32 %y, i32* %id, i32* %out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %y) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %id) nounwind, !map !23
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out) nounwind, !map !29
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !33), !dbg !34 ; [debug line = 1:20] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !35), !dbg !36 ; [debug line = 1:28] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i32* %id}, i64 0, metadata !37), !dbg !38 ; [debug line = 1:37] [debug variable = id]
  call void @llvm.dbg.value(metadata !{i32* %out}, i64 0, metadata !39), !dbg !40 ; [debug line = 1:47] [debug variable = out]
  call void (...)* @_ssdm_op_SpecIFCore(i32 %y, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [19 x i8]* @.str2) nounwind, !dbg !41 ; [debug line = 2:1]
  call void (...)* @_ssdm_op_SpecIFCore(i32 0, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [19 x i8]* @.str2) nounwind, !dbg !41 ; [debug line = 2:1]
  call void (...)* @_ssdm_op_SpecIFCore(i32 %x, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [19 x i8]* @.str2) nounwind, !dbg !41 ; [debug line = 2:1]
  store i32 125, i32* %id, align 4, !dbg !43      ; [debug line = 3:2]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %id, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [19 x i8]* @.str2) nounwind, !dbg !44 ; [debug line = 4:1]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !45), !dbg !46 ; [debug line = 4:2] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !47), !dbg !48 ; [debug line = 5:2] [debug variable = b]
  br label %1, !dbg !49                           ; [debug line = 6:4]

; <label>:1                                       ; preds = %2, %0
  %c = phi i32 [ %x, %0 ], [ %a, %2 ]             ; [#uses=3 type=i32]
  %b = phi i32 [ %y, %0 ], [ %c, %2 ]             ; [#uses=2 type=i32]
  %tmp = icmp eq i32 %c, 0, !dbg !49              ; [#uses=1 type=i1] [debug line = 6:4]
  br i1 %tmp, label %3, label %2, !dbg !49        ; [debug line = 6:4]

; <label>:2                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !50), !dbg !51 ; [debug line = 7:7] [debug variable = c]
  %a = srem i32 %b, %c, !dbg !53                  ; [#uses=1 type=i32] [debug line = 7:14]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !45), !dbg !53 ; [debug line = 7:14] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !47), !dbg !54 ; [debug line = 7:23] [debug variable = b]
  br label %1, !dbg !55                           ; [debug line = 8:4]

; <label>:3                                       ; preds = %1
  %b.lcssa = phi i32 [ %b, %1 ]                   ; [#uses=1 type=i32]
  store i32 %b.lcssa, i32* %out, align 4, !dbg !56 ; [debug line = 9:4]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %out, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [19 x i8]* @.str2) nounwind, !dbg !57 ; [debug line = 10:1]
  ret void, !dbg !58                              ; [debug line = 11:1]
}

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=5]
declare void @_ssdm_op_SpecIFCore(...)

; [#uses=4]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"C:/Temp/RC/HWA_func/solution1/.autopilot/db/HWA_func.pragma.2.cpp", metadata !"c:/Temp/RC", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"HWA_func", metadata !"HWA_func", metadata !"_Z8HWA_funciiPiS_", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, i32*, i32*)* @HWA_func, null, null, metadata !11, i32 1} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"HWA_func/HWA_func.cpp", metadata !"c:/Temp/RC", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !10, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"x", metadata !17, metadata !"int"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 0, i32 0}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"y", metadata !17, metadata !"int"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"id", metadata !27, metadata !"int"}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 0, i32 1}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 31, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"out", metadata !27, metadata !"int"}
!33 = metadata !{i32 786689, metadata !5, metadata !"x", metadata !6, i32 16777217, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!34 = metadata !{i32 1, i32 20, metadata !5, null}
!35 = metadata !{i32 786689, metadata !5, metadata !"y", metadata !6, i32 33554433, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!36 = metadata !{i32 1, i32 28, metadata !5, null}
!37 = metadata !{i32 786689, metadata !5, metadata !"id", metadata !6, i32 50331649, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 1, i32 37, metadata !5, null}
!39 = metadata !{i32 786689, metadata !5, metadata !"out", metadata !6, i32 67108865, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 1, i32 47, metadata !5, null}
!41 = metadata !{i32 2, i32 1, metadata !42, null}
!42 = metadata !{i32 786443, metadata !5, i32 1, i32 53, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!43 = metadata !{i32 3, i32 2, metadata !42, null}
!44 = metadata !{i32 4, i32 1, metadata !42, null}
!45 = metadata !{i32 786688, metadata !42, metadata !"a", metadata !6, i32 2, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 4, i32 2, metadata !42, null}
!47 = metadata !{i32 786688, metadata !42, metadata !"b", metadata !6, i32 2, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 5, i32 2, metadata !42, null}
!49 = metadata !{i32 6, i32 4, metadata !42, null}
!50 = metadata !{i32 786688, metadata !42, metadata !"c", metadata !6, i32 2, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 7, i32 7, metadata !52, null}
!52 = metadata !{i32 786443, metadata !42, i32 6, i32 21, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 7, i32 14, metadata !52, null}
!54 = metadata !{i32 7, i32 23, metadata !52, null}
!55 = metadata !{i32 8, i32 4, metadata !52, null}
!56 = metadata !{i32 9, i32 4, metadata !42, null}
!57 = metadata !{i32 10, i32 1, metadata !42, null}
!58 = metadata !{i32 11, i32 1, metadata !42, null}
