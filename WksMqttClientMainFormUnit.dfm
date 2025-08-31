inherited MainForm: TMainForm
  Anchors = [akTop, akRight]
  Caption = 'MainForm'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Top = 212
    Height = 389
    ExplicitLeft = 556
    ExplicitTop = 212
    ExplicitHeight = 389
  end
  inherited TopPanel: TPanel
    Height = 212
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 212
    inherited LogoImage: TImage
      Height = 183
      ExplicitLeft = 910
      ExplicitHeight = 183
    end
    inherited TopPageControl: TPageControl
      Height = 206
      ActivePage = TestTabSheet
      ExplicitHeight = 206
      inherited XxxTabSheet: TTabSheet
        Caption = 'Client'
        ExplicitHeight = 176
      end
      object MqttTabSheet: TTabSheet
        Caption = 'Mqtt'
        ImageIndex = 5
        object MqttProtocolNameLabel: TLabel
          Left = 16
          Top = 11
          Width = 78
          Height = 15
          Caption = 'Protocol name'
        end
        object MqttProtocolLevelLabel: TLabel
          Left = 16
          Top = 40
          Width = 72
          Height = 15
          Caption = 'Protocol level'
        end
        object MqttProtocolNameEdit: TEdit
          Left = 100
          Top = 8
          Width = 74
          Height = 23
          Enabled = False
          TabOrder = 0
          Text = 'MqttProtocolNameEdit'
        end
        object MqttProtocolLevelComboBox: TComboBox
          Left = 100
          Top = 37
          Width = 74
          Height = 23
          TabOrder = 1
          Text = 'MqttProtocolLevelComboBox'
          Items.Strings = (
            '1.0'
            '1.1'
            '3.0'
            '3.1'
            '3.1.1')
        end
      end
      object ServerTabSheet: TTabSheet
        Caption = 'Server'
        ImageIndex = 7
        object ServerHostLabel: TLabel
          Left = 121
          Top = 12
          Width = 25
          Height = 15
          Caption = 'Host'
        end
        object ServerPortLabel: TLabel
          Left = 121
          Top = 41
          Width = 22
          Height = 15
          Caption = 'Port'
        end
        object ServerHostEdit: TEdit
          Left = 152
          Top = 9
          Width = 220
          Height = 23
          TabOrder = 0
          Text = 'ServerHostEdit'
        end
        object ServerPortEdit: TEdit
          Left = 152
          Top = 38
          Width = 59
          Height = 23
          TabOrder = 1
          Text = 'ServerPortEdit'
        end
        object ServerJoinButton: TButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Join'
          TabOrder = 2
          OnClick = ServerJoinButtonClick
        end
        object ServerDisjoinButton: TButton
          Left = 16
          Top = 39
          Width = 75
          Height = 25
          Caption = 'Disjoin'
          TabOrder = 3
          OnClick = ServerDisjoinButtonClick
        end
      end
      object ConnectRequestTabSheet: TTabSheet
        Caption = 'CONNECT'
        ImageIndex = 4
        object ConnectKeepAliveSecondsLabel: TLabel
          Left = 124
          Top = 97
          Width = 138
          Height = 15
          Caption = 'Keep alive every (seconds)'
        end
        object ConnectWillTopicLabel: TLabel
          Left = 456
          Top = 12
          Width = 50
          Height = 15
          Caption = 'Will topic'
        end
        object ConnectWillMessageLabel: TLabel
          Left = 438
          Top = 41
          Width = 69
          Height = 15
          Caption = 'Will message'
        end
        object ConnectPasswordLabel: TLabel
          Left = 683
          Top = 41
          Width = 50
          Height = 15
          Caption = 'Password'
        end
        object ConnectUsernameLabel: TLabel
          Left = 680
          Top = 12
          Width = 53
          Height = 15
          Caption = 'Username'
        end
        object ConnectObjectIdLabel: TLabel
          Left = 214
          Top = 41
          Width = 48
          Height = 15
          Caption = 'Object Id'
        end
        object ConnectWillQosLabel: TLabel
          Left = 462
          Top = 70
          Width = 45
          Height = 15
          Caption = 'Will QoS'
        end
        object ConnectObjectKindLabel: TLabel
          Left = 200
          Top = 12
          Width = 62
          Height = 15
          Caption = 'Object Kind'
        end
        object ConnectPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Send CONNECT packet'
          TabOrder = 0
          OnClick = ConnectPacketSendButtonClick
        end
        object ConnectKeepAliveSecondsEdit: TEdit
          Left = 268
          Top = 94
          Width = 41
          Height = 23
          TabOrder = 1
          Text = 'ConnectKeepAliveSecondsEdit'
        end
        object ConnectWillTopicEdit: TEdit
          Left = 513
          Top = 9
          Width = 150
          Height = 23
          TabOrder = 2
          Text = 'ConnectWillTopicEdit'
        end
        object ConnectWillMessageEdit: TEdit
          Left = 513
          Top = 38
          Width = 150
          Height = 23
          TabOrder = 3
          Text = 'ConnectWillMessageEdit'
        end
        object ConnectWillActiveCheckBox: TCheckBox
          Left = 448
          Top = 96
          Width = 82
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Will Active'
          TabOrder = 4
        end
        object ConnectCredentialsActiveCheckBox: TCheckBox
          Left = 693
          Top = 68
          Width = 62
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Active'
          TabOrder = 5
        end
        object ConnectUsernameEdit: TEdit
          Left = 739
          Top = 9
          Width = 150
          Height = 23
          TabOrder = 6
          Text = 'ConnectUsernameEdit'
        end
        object ConnectPasswordEdit: TEdit
          Left = 739
          Top = 38
          Width = 150
          Height = 23
          TabOrder = 7
          Text = 'ConnectPasswordEdit'
        end
        object ConnectObjectIdEdit: TEdit
          Left = 268
          Top = 38
          Width = 150
          Height = 23
          TabOrder = 8
          Text = 'ConnectObjectIdEdit'
        end
        object DisconnectPacketSendButton: TButton
          Left = 16
          Top = 39
          Width = 161
          Height = 25
          Caption = 'Send DISCONNECT packet'
          TabOrder = 9
          OnClick = DisconnectPacketSendButtonClick
        end
        object ConnectCleanSessionCheckBox: TCheckBox
          Left = 188
          Top = 70
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Clean session'
          TabOrder = 10
        end
        object ConnectQosComboBox: TComboBox
          Left = 513
          Top = 67
          Width = 150
          Height = 23
          TabOrder = 11
          Text = 'MqttProtocolLevelComboBox'
          Items.Strings = (
            'QoS 0'
            'QoS 1'
            'QoS 2')
        end
        object ConnectObjectKindComboBox: TComboBox
          Left = 268
          Top = 9
          Width = 150
          Height = 23
          TabOrder = 12
          Text = 'ConnectObjectKindComboBox'
          Items.Strings = (
            'Account'
            'Agent'
            'Code'
            'Document'
            'Equipment'
            'File'
            'Form'
            'Image'
            'Invoice'
            'Member'
            'Organization'
            'Page'
            'Person'
            'Report'
            'Spc'
            'Task'
            'User')
        end
      end
      object PingRequestTabSheet: TTabSheet
        Caption = 'PINGREQ'
        ImageIndex = 8
        object PingRequestPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Send PINGREQ packet'
          TabOrder = 0
          OnClick = PingRequestPacketSendButtonClick
        end
      end
      object PublishRequestTabSheet: TTabSheet
        Caption = 'PUBLISH'
        ImageIndex = 3
        DesignSize = (
          933
          176)
        object PublishTopicLabel: TLabel
          Left = 216
          Top = 12
          Width = 69
          Height = 15
          Caption = 'Publish topic'
        end
        object PublishMessageLabel: TLabel
          Left = 197
          Top = 41
          Width = 88
          Height = 15
          Caption = 'Publish message'
        end
        object PublishQosLabel: TLabel
          Left = 263
          Top = 70
          Width = 22
          Height = 15
          Caption = 'QoS'
        end
        object PublishCountLabel: TLabel
          Left = 16
          Top = 120
          Width = 33
          Height = 15
          Caption = 'Count'
        end
        object PublishPauseMsLabel: TLabel
          Left = 111
          Top = 120
          Width = 58
          Height = 15
          Caption = 'Pause (ms)'
        end
        object PublishPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Send PUBLISH Packet'
          TabOrder = 0
          OnClick = PublishPacketSendButtonClick
        end
        object PublishTopicEdit: TEdit
          Left = 291
          Top = 9
          Width = 627
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'PublishTopicEdit'
        end
        object PublishMessageEdit: TEdit
          Left = 291
          Top = 38
          Width = 627
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 'PublishMessageEdit'
        end
        object PublishQosComboBox: TComboBox
          Left = 291
          Top = 67
          Width = 157
          Height = 23
          TabOrder = 3
          Text = 'PublishQosComboBox'
          Items.Strings = (
            'QoS 0'
            'QoS 1'
            'QoS 2')
        end
        object PublishDupFlagCheckBox: TCheckBox
          Left = 157
          Top = 96
          Width = 151
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Retransmitted message'
          TabOrder = 4
        end
        object PublishRetainCheckBox: TCheckBox
          Left = 248
          Top = 119
          Width = 60
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Retain'
          TabOrder = 5
        end
        object PublishCountComboBox: TComboBox
          Left = 16
          Top = 141
          Width = 89
          Height = 23
          TabOrder = 6
          Text = 'PublishCountComboBox'
          Items.Strings = (
            '1'
            '10'
            '100'
            '1000')
        end
        object PublishPauseMsComboBox: TComboBox
          Left = 111
          Top = 141
          Width = 89
          Height = 23
          TabOrder = 7
          Text = 'PublishPauseMsComboBox'
          Items.Strings = (
            '0'
            '1'
            '10'
            '100'
            '1000')
        end
      end
      object SubscribeRequestTabSheet: TTabSheet
        Caption = 'SUBSCRIBE'
        ImageIndex = 6
        DesignSize = (
          933
          176)
        object SubscribeTopicFilterListLabel: TLabel
          Left = 216
          Top = 8
          Width = 102
          Height = 15
          Caption = 'Topics (Filters, Qos)'
        end
        object SubscribePacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Send SUBSCRIBE Packet'
          TabOrder = 0
          OnClick = SubscribePacketSendButtonClick
        end
        object UnsubscribePacketSendButton: TButton
          Left = 16
          Top = 39
          Width = 161
          Height = 25
          Caption = 'Send UNSUBSCRIBE Packet'
          TabOrder = 1
          OnClick = UnsubscribePacketSendButtonClick
        end
        object SubscribeTopicFilterListMemo: TMemo
          Left = 216
          Top = 29
          Width = 705
          Height = 128
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'SubscribeTopicFilterListMemo')
          TabOrder = 2
        end
      end
      object TestTabSheet: TTabSheet
        Caption = ' Test'
        ImageIndex = 7
        object TestCountLabel: TLabel
          Left = 16
          Top = 8
          Width = 33
          Height = 15
          Caption = 'Count'
        end
        object TestPauseMsLabel: TLabel
          Left = 111
          Top = 8
          Width = 58
          Height = 15
          Caption = 'Pause (ms)'
        end
        object TestCountComboBox: TComboBox
          Left = 16
          Top = 29
          Width = 89
          Height = 23
          TabOrder = 0
          Text = 'ConnectCountComboBox'
          Items.Strings = (
            '1'
            '10'
            '100'
            '1000')
        end
        object TestPauseMsComboBox: TComboBox
          Left = 111
          Top = 29
          Width = 89
          Height = 23
          TabOrder = 1
          Text = 'ConnectPauseMsComboBox'
          Items.Strings = (
            '0'
            '1'
            '10'
            '100'
            '1000')
        end
        object TestStartButton: TButton
          Left = 206
          Top = 28
          Width = 51
          Height = 25
          Caption = 'Start'
          TabOrder = 2
          OnClick = TestStartButtonClick
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Top = 212
    Height = 389
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 212
    ExplicitHeight = 389
    inherited MainPageControl: TPageControl
      Height = 383
      ExplicitHeight = 383
      inherited LogTabSheet: TTabSheet
        ExplicitHeight = 353
        inherited LogTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited LogSynEdit: TSynEdit
          Height = 320
          ExplicitHeight = 320
        end
      end
    end
  end
  inherited RightPanel: TPanel
    Top = 212
    Height = 389
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 212
    ExplicitHeight = 389
    inherited RightPageControl: TPageControl
      Height = 383
      ExplicitHeight = 383
    end
  end
end
