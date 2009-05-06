object ScriptProject: TScriptProject
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 448
  Width = 130
  object PC: TPaxCompiler
    Alignment = 1
    OnCompilerProgress = PCCompilerProgress
    DebugMode = False
    Left = 43
    Top = 71
  end
  object PPL: TPaxPascalLanguage
    CompleteBooleanEval = True
    UnitLookup = True
    Left = 44
    Top = 125
  end
  object PP: TPaxProgram
    Console = False
    OnPause = PPPause
    OnException = PPException
    OnUnhandledException = PPException
    OnCreateObject = PPCreateObject
    OnAfterObjectCreation = PPAfterObjectCreation
    OnDestroyObject = PPDestroyObject
    OnAfterObjectDestruction = PPAfterObjectDestruction
    OnPrintEvent = PPPrintEvent
    Left = 44
    Top = 176
  end
  object PCD: TPaxCompilerDebugger
    Left = 42
    Top = 230
  end
  object PCE: TPaxCompilerExplorer
    Left = 40
    Top = 284
  end
  object dlgSaveNewUnit: TSaveDialog
    DefaultExt = '*.pas'
    Filter = 'Units|*.pas|All files|*.*'
    InitialDir = '.\scripts'
    Options = [ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofNoNetworkButton, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1102#1085#1080#1090' '#1087#1086#1076' '#1080#1084#1077#1085#1077#1084
    Left = 42
    Top = 342
  end
  object siLangLinked1: TsiLangLinked
    Version = '6.1.0.1'
    StringsTypes.Strings = (
      'TIB_STRINGLIST'
      'TSTRINGLIST')
    AutoSkipEmpties = True
    NumOfLanguages = 2
    LangDispatcher = fMain.siLangDispatcher
    OnChangeLanguage = siLangLinked1ChangeLanguage
    LangDelim = 1
    LangNames.Strings = (
      'Default'
      'English')
    Language = 'Default'
    CommonContainer = fEditorMain.siLang1
    ExcludedProperties.Strings = (
      'Category'
      'SecondaryShortCuts'
      'HelpKeyword'
      'InitialDir'
      'HelpKeyword'
      'ActivePage'
      'ImeName'
      'DefaultExt'
      'FileName'
      'FieldName'
      'PickList'
      'DisplayFormat'
      'EditMask'
      'KeyList'
      'LookupDisplayFields'
      'DropDownSpecRow'
      'TableName'
      'DatabaseName'
      'IndexName'
      'MasterFields')
    Left = 42
    Top = 15
    TranslationData = {
      737443617074696F6E730D0A737448696E74730D0A7374446973706C61794C61
      62656C730D0A7374466F6E74730D0A54664F626A496E73706563746F72015461
      686F6D61015461686F6D61010D0A53706C61736831015461686F6D6101546168
      6F6D61010D0A4A76496E73706563746F7231015461686F6D61015461686F6D61
      010D0A73744D756C74694C696E65730D0A7374537472696E67730D0A73747272
      73556E69744E6F74466F756E64012573202D20F4E0E9EB20EEF2F1F2F3F2F1E2
      F3E5F22E257320DEEDE8F220E1F3E4E5F220F3E4E0EBE5ED20F120EFF0EEE5EA
      F2E0012573202D2046696C65206E6F7420666F756E642E20257320556E697420
      77696C6C2062652064656C657465642066726F6D2070726F6A656374010D0A73
      74727273556E6974536176656401DEEDE8F220257320F1EEF5F0E0EDE5ED20EA
      E0EA20257301556E6974202573207361766564206173202573010D0A73747272
      73556E69744C6F6164656401DEEDE8F220257320E7E0E3F0F3E6E5ED20E8E720
      257301556E6974202573206C6F616465642066726F6D202573010D0A73747272
      7350726F6A656374536176656401CFF0EEE5EAF220257320F1EEF5F0E0EDE5ED
      20EAE0EA2025730150726F6A656374202573207361766564206164202573010D
      0A737472727357686F6C6550726F6A656374536176656401CFF0EEE5EAF22025
      7320E820F1EEEEF2E2E5F2F1F2E2F3FEF9E8E520E5ECF320FEEDE8F2FB20F1EE
      F5F0E0EDE5EDFB0150726F6A65637420257320616E6420616C6C20696E636C75
      64656420756E697473207361766564010D0A7374727273536176654368616E67
      6573426534436C6F73696E6701D1EEF5F0E0EDE8F2FC20E8E7ECE5EDE5EDE8FF
      20E220257320EFE5F0E5E420E7E0EAF0FBF2E8E5EC203F015361766520636861
      6E67657320696E202573206265666F726520636C6F73696E67203F010D0A7374
      727273436F6D70696C6C656401257320F3F1EFE5F8EDEE20F1EAEEECEFE8EBE8
      F0EEE2E0ED01257320636F6D70696C6C6564010D0A7374727273556E6974416C
      726561647945786973747301DEEDE8F220F120F2E0EAE8EC20E8ECE5EDE5EC20
      F3E6E520F1F3F9E5F1F2E2F3E5F220E220EFF0EEE5EAF2E501556E6974207769
      74682073616D65206E616D6520616C72656164792065786973747320696E2070
      726F6A656374010D0A7374727273496E76616C6964556E69744E616D6501D3EA
      E0E7E0EDEDEE20EDE5E2E5F0EDEEE520E8ECFF20E4EBFF20FEEDE8F2E0014E6F
      742076616C696420756E69746E616D6520737065636966696564010D0A737472
      727344656C657465556E6974436F6E6669726D01C2FB20E4E5E9F1F2E2E8F2E5
      EBFCEDEE20F5EEF2E8F2E520F3E4E0EBE8F2FC20FEEDE8F220257320E8E720EF
      F0EEE5EAF2E03F01596F75207265616C6C792077616E742064656C6574652075
      6E69742025732066726F6D2063757272656E742070726F6A6563743F010D0A73
      747272735061757365644F6E4C696E6501CFE0F3E7E02E20DEEDE8F23A202573
      2E20CBE8EDE8FF3A202564015061757365642E20556E69743A2025732E206C69
      6E653A202564010D0A466174616C4572726F725363726970745465726D696E61
      746564015B52756E74696D655D20CAF0E8F2E8F7E5F1EAE0FF20EEF8E8E1EAE0
      20E220E4E5E1E0E3E5F0E52E20E2FBEFEEEBEDE5EDE8E520EFF0E5F0E2E0EDEE
      2E015B52756E74696D655D20466174616C206572726F722E2073637269707420
      7465726D696E61746564010D0A7374727273456E7465724E616D65466F725661
      726961626C6501C2E2E5E4E8F2E520E8ECFF20EFE5F0E5ECE5EDEDEEE901496E
      707574207661726961626C65206E616D65010D0A737472727341646457617263
      686C69737401C4EEE1E0E2EBE5EDE8E520E22057617463684C69737401616464
      20746F2057617463684C697374010D0A73747272735265616C6C7957616E7444
      656C65746550726F6A65637401C2FB20E4E5E9F1F2E2E8F2E5EBFCEDEE20F5EE
      F2E8F2E520F3E4E0EBE8F2FC20EFF0EEE5EAF2202573203F01596F7520726561
      6C6C792077616E742064656C6574652070726F6A656374202573203F010D0A73
      7472727343616C6C696E6746756E6374696F6E01CEF8E8E1EAE020EFF0E820E2
      FBE7EEE2E520F4F3EDEAF6E8E820526561644420E22025732028E2FBE7EEE220
      E22025732C20EDE020EBE8EDE8E820256429014572726F72207768696C652063
      616C6C696E672066756E6374696F6E20257320696E2070726F6A656374202573
      2028756E69742025732C206C696E6520256429010D0A73744F74686572537472
      696E67730D0A646C67536176654E6577556E69742E46696C74657201556E6974
      737C2A2E7061737C416C6C2066696C65737C2A2E2A01010D0A646C6753617665
      4E6577556E69742E5469746C6501D1EEF5F0E0EDE8F2FC20EDEEE2FBE920FEED
      E8F220EFEEE420E8ECE5EDE5EC0153617665206E657720756E69742061732E2E
      010D0A7374436F6C6C656374696F6E730D0A737443686172536574730D0A5466
      4F626A496E73706563746F720144454641554C545F4348415253455401444546
      41554C545F43484152534554010D0A53706C617368310144454641554C545F43
      4841525345540144454641554C545F43484152534554010D0A4A76496E737065
      63746F72310144454641554C545F434841525345540144454641554C545F4348
      4152534554010D0A}
  end
end
