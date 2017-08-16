#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

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
	Local _oFontSml := TFont():New("Arial"   ,,08,,.T.,,,,,.F.,.F.)
	Local _oFontTrm := TFont():New("FixedSys",,14,,.F.,,,,,.F.,.F.)
	
	Local _cCommand := Space(500)
	
	If Type("cEmpAnt") == "U"
		PREPARE Environment EMPRESA "01" FILIAL "01"
	EndIf
	
	_oDlg := TDialog():New(000,000,600,800,"Terminal",,,,,CLR_BLACK,CLR_WHITE,,,.T.)
	
	_oTBar := TBar():new(_oDlg,025,032,.T.,Nil,Nil,"FND_LGND",.F.)
	_oTBar:nHeight := 30
	
	TSay():New(010,010,{|| " Terminal" },_oTBar,,_oFontLab,,,,.T.,CLR_BLACK,CLR_WHITE,400,10)
	_oBtExit := TBtnBmp2():New(000,000,035,025,"FINAL",,,,{|| _oDlg:End() },_oTBar,"Exit",,.F.,.F.)
	_oBtExit:align := 2
	
	_oTail := TSimpleEditor():New(000,000,_oDlg,400,270)
	_oTail:lReadOnly := .T.
	//_oTail:lPixel := .T.
	//_oTail:Load( "Novo texto <b>Negrito</b><font color=red> Texto em Vermelho</font><font size=14> Texto com tamanho grande</font>" )
				
	_oCommands := TGet():New(270,000,{|u| If(PCount()>0,_cCommand := u,_cCommand)},_oDlg,380,012,"@!",{|| .T.},;
			RGB(47,79,79),RGB(245,245,245),_oFontTxt,.F.,Nil,.T.,Nil,.F.,{|| .T.},.F.,.F.,{|| .T.},.F.,.F.,Nil,"_cCommand",;
			"",.T.,0,.T.,.F.,.T.,,1,_oFontSml,CLR_BLACK,"Digite os comandos aqui...")
	
	_oBtExec := TButton():New(270,380,("&"+ Chr(13) +"Go!"),_oDlg,{|| _oTail:Load("teste") },20,16,,,.F.,.T.,.F.,,.F.,,,.F.)
	//_oBtAddP:SetCss(sfEstiloBt("OK.png"))
	
	_oDlg:Activate(,,,.T.,{|| .T.},,{|| .T.})

Return()

/*---------------------------------------------------------------------*
 | Class: Terminal                                                     |
 *---------------------------------------------------------------------*/
Class Terminal
	//Atributos
	Data nBgColor as int
	Data aCommands as Array
	
	//Metodos que você deve usar
	Method New() CONSTRUCTOR
	Method Start()
	
	//Metodos que a classe usa, use por sua conta em risco!
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

	Self:aCommands := {}
	//aAdd(Self:aCommands,{})
	
Return