*&---------------------------------------------------------------------*
*& Report Z3217_SINGLETON_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z3217_SINGLETON_001.
CLASS cl_singleton DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA p_my_class TYPE REF TO cl_singleton.
    CLASS-METHODS get_instance RETURNING VALUE(r_my_class) TYPE REF TO cl_singleton.
ENDCLASS.

CLASS cl_singleton IMPLEMENTATION.
  METHOD get_instance.
    IF p_my_class IS INITIAL.
      WRITE / 'Created new instance'.
      p_my_class = NEW #( ).
    ELSE.
      WRITE / 'Do not create new instance. Just return the same created before'.
    ENDIF.
    r_my_class = p_my_class.
  ENDMETHOD.
ENDCLASS.

DATA lcl_my_class TYPE REF TO cl_singleton.

START-OF-SELECTION.

  lcl_my_class = cl_singleton=>get_instance(  ). " -> Output: Created new instance
  lcl_my_class = cl_singleton=>get_instance(  ). " -> Output: Do not create new instance. Just return the same created before
  lcl_my_class = cl_singleton=>get_instance(  ). " -> Output: Do not create new instance. Just return the same created before
