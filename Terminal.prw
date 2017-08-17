#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

/*---------------------------------------------------------------------*
 | Function: Terminal                                                  |
 | Description: Simula um teminal com funcionalidades em AdvPL         |
 *---------------------------------------------------------------------*/
User Function Terminal()

	Local _oTerminal := Terminal():New()
	
	If Type("cEmpAnt") == "U"
		PREPARE Environment EMPRESA "01" FILIAL "01"
	EndIf
	
	_oTerminal:Start()

Return()

/*---------------------------------------------------------------------*
 | Class: Terminal                                                     |
 *---------------------------------------------------------------------*/
Class Terminal
	//Atributos
	Data aCommands   as Array
	
	//Dialog
	Data oDialog  as Object
	Data oFontLab as Object
	Data oFontTrm as Object
	Data cCommand as String
	Data cTxtTail as String
	
	//Metodos
	Method New() CONSTRUCTOR
	Method Start()
	Method OpenDialog()
	Method AppendText()
	Method ExecCommand()
	Method LoadCommands()

EndClass

/*---------------------------------------------------------------------*
 | Method: New                                                         |
 *---------------------------------------------------------------------*/
Method New() Class Terminal
	
	Self:oDialog  := Nil
	Self:oFontLab := TFont():New("Arial"   ,,28,,.T.,,,,,.F.,.F.)
	Self:oFontTrm := TFont():New("FixedSys",,14,,.F.,,,,,.F.,.F.)
	Self:cCommand := Space(250)
	Self:cTxtTail := ""
	
	Self:LoadCommands()
	
Return Self

/*---------------------------------------------------------------------*
 | Method: Start                                                       |
 *---------------------------------------------------------------------*/
Method Start() Class Terminal

	Self:OpenDialog()

Return()

/*---------------------------------------------------------------------*
 | Method: OpenDialog                                                  |
 *---------------------------------------------------------------------*/
Method OpenDialog() Class Terminal

Local _oObj  := Nil
Local _cJson := ""

_cJson += '{'
_cJson += ' "oDlg": null, '
_cJson += ' "oTBar": null, '
_cJson += ' "oTSay": null, '
_cJson += ' "oBtExit": null, '
_cJson += ' "oTail": null, '
_cJson += ' "oGetCmd": null '
_cJson += '}'

If FWJsonDeserialize(_cJson, @_oObj)
	Self:oDialog := _oObj
	
	Self:oDialog:oDlg    := TDialog():New(000,000,600,800,"Terminal",,,,,CLR_BLACK,CLR_WHITE,,,.T.)
	Self:oDialog:oTBar   := TBar():new(Self:oDialog:oDlg,025,032,.T.,Nil,Nil,"FND_LGND",.F.)
	Self:oDialog:oTBar:nHeight := 30
	Self:oDialog:oTSay   := TSay():New(010,010,{|| " Terminal" },Self:oDialog:oTBar,,Self:oFontLab,,,,.T.,CLR_BLACK,CLR_WHITE,400,10)
	Self:oDialog:oBtExit := TBtnBmp2():New(000,000,035,025,"FINAL",,,,{|| Self:oDialog:oDlg:End() },Self:oDialog:oTBar,"Exit",,.F.,.F.)
	Self:oDialog:oBtExit:align := 2
	Self:oDialog:oTail   := TSimpleEditor():New(000,000,Self:oDialog:oDlg,400,270)
	Self:oDialog:oTail:bSetGet := {|| If(PCount()>0,Self:cTxtTail := u,Self:cTxtTail) }
	Self:oDialog:oTail:lReadOnly := .T.
	Self:oDialog:oGetCmd := TGet():New(270,000,{|u| If(PCount()>0,Self:cCommand := u,Self:cCommand)},Self:oDialog:oDlg,400,012,"@!",{|| (Self:oDialog:oGetCmd:SetFocus(),.T.)},;
		RGB(47,79,79),RGB(245,245,245),Self:oFontTrm,.F.,Nil,.T.,Nil,.F.,{|| .T.},.F.,.F.,{|| Self:AppendText(Self:cCommand) },.F.,.F.,Nil,"Self:cCommand",;
		"",.T.,0,.T.,.F.,.T.,,1,Self:oFontTrm,CLR_BLACK,"Digite os comandos aqui...")
	Self:oDialog:oGetCmd:SetFocus()
	Self:oDialog:oDlg:Activate(,,,.T.,{|| .t.},,{|| .t.})
Else
	MessageBox("Classe disponivel apenas para Microsiga Protheus 11 em diante.","Atenção",48)
EndIf

Return Nil

/*---------------------------------------------------------------------*
 | Method: AppendText                                                  |
 *---------------------------------------------------------------------*/
Method AppendText(_cTexto) Class Terminal

	Self:cCommand := Space(250)
	Self:cTxtTail += _cTexto + "<br>"
	Self:oDialog:oTail:GoEnd()
	Self:oDialog:oDlg:CommitControls()

Return .T.

/*---------------------------------------------------------------------*
 | Method: ExecCommand                                                 |
 *---------------------------------------------------------------------*/
Method ExecCommand() Class Terminal
	
	Local _cRet := ""
	//Self:cCommand
	
Return _cRet

/*---------------------------------------------------------------------*
 | Method: LoadCommands                                                |
 *---------------------------------------------------------------------*/
Method LoadCommands() Class Terminal

	Self:aCommands := {}
	//aAdd(Self:aCommands,{})
	
Return