object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 269
  Width = 496
  object LSPControl: TLSPModuleControl
    onLspModuleState = LSPControlLspModuleState
    onConnect = LSPControlConnect
    onDisconnect = LSPControlDisconnect
    onRecv = LSPControlRecv
    onSend = LSPControlSend
    Left = 40
    Top = 16
  end
  object timerSearchProcesses: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = timerSearchProcessesTimer
    Left = 40
    Top = 72
  end
  object fsClassesRTTI1: TfsClassesRTTI
    Left = 216
    Top = 40
  end
  object fsFormsRTTI1: TfsFormsRTTI
    Left = 224
    Top = 96
  end
  object fsExtCtrlsRTTI1: TfsExtCtrlsRTTI
    Left = 224
    Top = 144
  end
  object fsDialogsRTTI1: TfsDialogsRTTI
    Left = 304
    Top = 32
  end
  object fsMenusRTTI1: TfsMenusRTTI
    Left = 304
    Top = 80
  end
  object fsIniRTTI1: TfsIniRTTI
    Left = 296
    Top = 152
  end
  object lang: TsiLang
    Version = '6.1.0.1'
    IsInheritedOwner = True
    StringsTypes.Strings = (
      'TIB_STRINGLIST'
      'TSTRINGLIST')
    SmartExcludeProps.Strings = (
      'Action4.Caption'
      'Action5.Caption'
      'Action6.Caption'
      'Action7.Caption'
      'Action8.Caption'
      'Action9.Caption'
      'Action10.Caption'
      'TL2PacketHackMain.Caption')
    UseInheritedData = True
    AutoSkipEmpties = True
    NumOfLanguages = 2
    LangDelim = 1
    DoNotTranslate.Strings = (
      'Action2'
      'Action3')
    LangNames.Strings = (
      'Rus'
      'Eng')
    Language = 'Rus'
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
    Left = 141
    Top = 12
    TranslationData = {
      737443617074696F6E730D0A737448696E74730D0A7374446973706C61794C61
      62656C730D0A7374466F6E74730D0A544C325061636B65744861636B4D61696E
      014D532053616E7320536572696601010D0A53706C617368014D532053616E73
      20536572696601010D0A53746174757342617231015461686F6D6101010D0A73
      744D756C74694C696E65730D0A7374446C677343617074696F6E730D0A576172
      6E696E67015761726E696E67015761726E696E67010D0A4572726F7201457272
      6F72014572726F72010D0A496E666F726D6174696F6E01496E666F726D617469
      6F6E01496E666F726D6174696F6E010D0A436F6E6669726D01436F6E6669726D
      01436F6E6669726D010D0A59657301265965730126596573010D0A4E6F01264E
      6F01264E6F010D0A4F4B014F4B014F4B010D0A43616E63656C0143616E63656C
      0143616E63656C010D0A41626F7274012641626F7274012641626F7274010D0A
      52657472790126526574727901265265747279010D0A49676E6F726501264967
      6E6F7265012649676E6F7265010D0A416C6C0126416C6C0126416C6C010D0A4E
      6F20546F20416C6C014E266F20746F20416C6C014E266F20746F20416C6C010D
      0A59657320546F20416C6C0159657320746F2026416C6C0159657320746F2026
      416C6C010D0A48656C70012648656C70012648656C70010D0A7374537472696E
      67730D0A4944535F313130015363726970743A20F1EAF0E8EFF220F120E8ECE5
      EDE5EC20015363726970743A204463727970742077697468206E616D65202001
      0D0A4944535F31313101EDE520EDE0E9E4E5ED2021016E6F7420666F756E6420
      21010D0A4944535F31313201D1EAF0E8EFF220EA20EAEEF2EEF0EEECF320E2FB
      20EEE1F0E0F9E0E5F2E5F1FC20280143616C6C6564207363727970742028010D
      0A4944535F313133012920EDE520E2EAEBFEF7E5ED210129206E6F7420747572
      6E6564206F6E21010D0A4944535F31313401CFF0E820E2FBE7EEE2E520014572
      726F72207768696C652063616C6C696E672020010D0A4944535F3131350120EF
      F0EEE8E7EEF8EBE020EEF8E8E1EAE020E220E2FBE7FBE2E0E5ECEEEC20ECE5F2
      EEE4E521202801202028010D0A4944535F31343901CEF8E8E1EAE03A20014572
      726F723A20010D0A4944535F313530012C20EFEEE7E8F6E8FF3A20012C20506F
      736974696F6E3A20010D0A4944535F31353101D1EAF0E8EFF220EEF2EAEEECEF
      E8EBE8F0EEE2E0ED210153637279707420636F6D70696C6C656421010D0A7374
      4F74686572537472696E67730D0A73744C6F63616C65730D0A7374436F6C6C65
      6374696F6E730D0A737443686172536574730D0A544C325061636B6574486163
      6B4D61696E0144454641554C545F434841525345540144454641554C545F4348
      4152534554010D0A53706C6173680144454641554C545F434841525345540144
      454641554C545F43484152534554010D0A537461747573426172310144454641
      554C545F434841525345540144454641554C545F43484152534554010D0A}
  end
  object dumbtimer: TTimer
    Interval = 10000
    OnTimer = dumbtimerTimer
    Left = 40
    Top = 128
  end
end
