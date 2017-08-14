#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

#DEFINE ENTER Chr(13) + Chr(10)

/*---------------------------------------------------------------------*
 | Function: Terminal                                                  |
 | Description: Simula um teminal com funcionalidades em AdvPL         |
 *---------------------------------------------------------------------*/
User Function Terminal()

Local _oDlg := Nil
Local _oTBar := Nil
Local _oMtGet := Nil
Local _oFontLab := TFont():New("Arial"   ,,28,,.T.,,,,,.F.,.F.)
Local _oFontTxt := TFont():New("FixedSys",,14,,.T.,,,,,.F.,.F.)
Local _oFontTrm := TFont():New("FixedSys",,14,,.F.,,,,,.F.,.F.)

_oDlg := TDialog():New(000,000,600,800,"Terminal",,,,,CLR_BLACK,CLR_WHITE,,,.T.)

_oTBar := TBar():new(_oDlg,025,032,.T.,Nil,Nil,"FND_LGND",.F.)
_oTBar:nHeight := 30

TSay():New(010,010,{|| " Terminal" },_oTBar,,_oFontLab,,,,.T.,CLR_BLACK,CLR_WHITE,400,10)
_oBtExit := TBtnBmp2():New(000,000,035,025,"FINAL",,,,{|| _oDlg:End() },_oTBar,"Exit",,.F.,.F.)
_oBtExit:align := 2

_oEdit := TSimpleEditor():New(000,000,_oDlg,400,284,"[ cText]")
_oEdit:Load( "Novo texto <b>Negrito</b><font color=red> Texto em Vermelho</font><font size=14> Texto com tamanho grande</font>" )
//_oMtGet := TMultiget():New(000,000,{|u| ""},_oDlg,400,284,_oFontTrm,,,,,.T.) 

_oDlg:Activate(,,,.T.,{|| .T.},,{|| .T.})

Return()

/*---------------------------------------------------------------------*
 | Class: Terminal                                                     |
 *---------------------------------------------------------------------*/
Class Terminal

Data aCommands as Array

Method New() CONSTRUCTOR
Method Start()

Method __LoadCommands()

EndClass

/*---------------------------------------------------------------------*
 | Method: New                                                         |
 *---------------------------------------------------------------------*/
Method New() Class Terminal

Return Self

/*---------------------------------------------------------------------*
 | Method: Start                                                       |
 *---------------------------------------------------------------------*/
Method Start() Class Terminal

Return

/*---------------------------------------------------------------------*
 | Method: __LoadCommands                                              |
 *---------------------------------------------------------------------*/
Method __LoadCommands() Class Terminal

Return