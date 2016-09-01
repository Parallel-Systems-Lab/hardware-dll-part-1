; ModuleID = 'C:/Temp/RC/HWA_func/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=20 type=[1 x i8]*]
@p_str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=5 type=[10 x i8]*]
@p_str2 = private unnamed_addr constant [19 x i8] c"-bus_bundle hwa_io\00", align 1 ; [#uses=5 type=[19 x i8]*]
@str = internal constant [9 x i8] c"HWA_func\00"  ; [#uses=1 type=[9 x i8]*]

; [#uses=0]
define void @HWA_func(i32 %x, i32 %y, i32* %id, i32* %out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %x) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %y) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %id) nounwind, !map !10
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out) nounwind, !map !16
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @str) nounwind
  %y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %y) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %y_read}, i64 0, metadata !20), !dbg !29 ; [debug line = 1:28] [debug variable = y]
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %x_read}, i64 0, metadata !30), !dbg !31 ; [debug line = 1:20] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !30), !dbg !31 ; [debug line = 1:20] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !20), !dbg !29 ; [debug line = 1:28] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i32* %id}, i64 0, metadata !32), !dbg !33 ; [debug line = 1:37] [debug variable = id]
  call void @llvm.dbg.value(metadata !{i32* %out}, i64 0, metadata !34), !dbg !35 ; [debug line = 1:47] [debug variable = out]
  call void (...)* @_ssdm_op_SpecIFCore(i32 %y, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [19 x i8]* @p_str2) nounwind, !dbg !36 ; [debug line = 2:1]
  call void (...)* @_ssdm_op_SpecIFCore(i32 0, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [19 x i8]* @p_str2) nounwind, !dbg !36 ; [debug line = 2:1]
  call void (...)* @_ssdm_op_SpecIFCore(i32 %x, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [19 x i8]* @p_str2) nounwind, !dbg !36 ; [debug line = 2:1]
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %id, i32 125) nounwind, !dbg !38 ; [debug line = 3:2]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %id, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [19 x i8]* @p_str2) nounwind, !dbg !39 ; [debug line = 4:1]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !40), !dbg !41 ; [debug line = 4:2] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !42), !dbg !43 ; [debug line = 5:2] [debug variable = b]
  br label %1, !dbg !44                           ; [debug line = 6:4]

; <label>:1                                       ; preds = %2, %0
  %c = phi i32 [ %x_read, %0 ], [ %a, %2 ]        ; [#uses=3 type=i32]
  %b = phi i32 [ %y_read, %0 ], [ %c, %2 ]        ; [#uses=2 type=i32]
  %tmp = icmp eq i32 %c, 0, !dbg !44              ; [#uses=1 type=i1] [debug line = 6:4]
  br i1 %tmp, label %3, label %2, !dbg !44        ; [debug line = 6:4]

; <label>:2                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !45), !dbg !46 ; [debug line = 7:7] [debug variable = c]
  %a = srem i32 %b, %c, !dbg !48                  ; [#uses=1 type=i32] [debug line = 7:14]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !40), !dbg !48 ; [debug line = 7:14] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !42), !dbg !49 ; [debug line = 7:23] [debug variable = b]
  br label %1, !dbg !50                           ; [debug line = 8:4]

; <label>:3                                       ; preds = %1
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %out, i32 %b) nounwind, !dbg !51 ; [debug line = 9:4]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %out, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [19 x i8]* @p_str2) nounwind, !dbg !52 ; [debug line = 10:1]
  ret void, !dbg !53                              ; [debug line = 11:1]
}

; [#uses=11]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=5]
define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

; [#uses=4]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=2]
define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

!llvm.map.gv = !{}

!0 = metadata !{metadata !1}
!1 = metadata !{i32 0, i32 31, metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{metadata !"x", metadata !4, metadata !"int"}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 0, i32 0, i32 0}
!6 = metadata !{metadata !7}
!7 = metadata !{i32 0, i32 31, metadata !8}
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !"y", metadata !4, metadata !"int"}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 31, metadata !12}
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !"id", metadata !14, metadata !"int"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 0, i32 1}
!16 = metadata !{metadata !17}
!17 = metadata !{i32 0, i32 31, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"out", metadata !14, metadata !"int"}
!20 = metadata !{i32 786689, metadata !21, metadata !"y", metadata !22, i32 33554433, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!21 = metadata !{i32 786478, i32 0, metadata !22, metadata !"HWA_func", metadata !"HWA_func", metadata !"_Z8HWA_funciiPiS_", metadata !22, i32 1, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, i32*, i32*)* @HWA_func, null, null, metadata !27, i32 1} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 786473, metadata !"HWA_func/HWA_func.cpp", metadata !"c:/Temp/RC", null} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{null, metadata !25, metadata !25, metadata !26, metadata !26}
!25 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!26 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!29 = metadata !{i32 1, i32 28, metadata !21, null}
!30 = metadata !{i32 786689, metadata !21, metadata !"x", metadata !22, i32 16777217, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 1, i32 20, metadata !21, null}
!32 = metadata !{i32 786689, metadata !21, metadata !"id", metadata !22, i32 50331649, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 1, i32 37, metadata !21, null}
!34 = metadata !{i32 786689, metadata !21, metadata !"out", metadata !22, i32 67108865, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!35 = metadata !{i32 1, i32 47, metadata !21, null}
!36 = metadata !{i32 2, i32 1, metadata !37, null}
!37 = metadata !{i32 786443, metadata !21, i32 1, i32 53, metadata !22, i32 0} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 3, i32 2, metadata !37, null}
!39 = metadata !{i32 4, i32 1, metadata !37, null}
!40 = metadata !{i32 786688, metadata !37, metadata !"a", metadata !22, i32 2, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 4, i32 2, metadata !37, null}
!42 = metadata !{i32 786688, metadata !37, metadata !"b", metadata !22, i32 2, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!43 = metadata !{i32 5, i32 2, metadata !37, null}
!44 = metadata !{i32 6, i32 4, metadata !37, null}
!45 = metadata !{i32 786688, metadata !37, metadata !"c", metadata !22, i32 2, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 7, i32 7, metadata !47, null}
!47 = metadata !{i32 786443, metadata !37, i32 6, i32 21, metadata !22, i32 1} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 7, i32 14, metadata !47, null}
!49 = metadata !{i32 7, i32 23, metadata !47, null}
!50 = metadata !{i32 8, i32 4, metadata !47, null}
!51 = metadata !{i32 9, i32 4, metadata !37, null}
!52 = metadata !{i32 10, i32 1, metadata !37, null}
!53 = metadata !{i32 11, i32 1, metadata !37, null}
