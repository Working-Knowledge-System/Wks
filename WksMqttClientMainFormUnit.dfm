inherited MainForm: TMainForm
  Anchors = [akTop, akRight]
  Caption = 'MainForm'
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1024
  ExplicitHeight = 640
  TextHeight = 15
  inherited TopPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited TopPageControl: TPageControl
      ActivePage = ServerTabSheet
      ExplicitWidth = 941
      inherited XxxTabSheet: TTabSheet
        Caption = 'Client'
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
          Left = 68
          Top = 97
          Width = 138
          Height = 15
          Caption = 'Keep alive every (seconds)'
        end
        object ConnectWillTopicLabel: TLabel
          Left = 400
          Top = 12
          Width = 50
          Height = 15
          Caption = 'Will topic'
        end
        object ConnectWillMessageLabel: TLabel
          Left = 382
          Top = 41
          Width = 69
          Height = 15
          Caption = 'Will message'
        end
        object ConnectPasswordLabel: TLabel
          Left = 651
          Top = 41
          Width = 50
          Height = 15
          Caption = 'Password'
        end
        object ConnectUsernameLabel: TLabel
          Left = 648
          Top = 12
          Width = 53
          Height = 15
          Caption = 'Username'
        end
        object ConnectClientIdentifierLabel: TLabel
          Left = 196
          Top = 12
          Width = 10
          Height = 15
          Caption = 'Id'
        end
        object ConnectQosLabel: TLabel
          Left = 184
          Top = 41
          Width = 22
          Height = 15
          Caption = 'QoS'
        end
        object ConnectPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 146
          Height = 25
          Caption = 'Send CONNECT packet'
          TabOrder = 0
          OnClick = ConnectPacketSendButtonClick
        end
        object ConnectKeepAliveSecondsEdit: TEdit
          Left = 212
          Top = 94
          Width = 41
          Height = 23
          TabOrder = 1
          Text = 'ConnectKeepAliveSecondsEdit'
        end
        object ConnectWillTopicEdit: TEdit
          Left = 457
          Top = 9
          Width = 177
          Height = 23
          TabOrder = 2
          Text = 'ConnectWillTopicEdit'
        end
        object ConnectWillMessageEdit: TEdit
          Left = 456
          Top = 38
          Width = 178
          Height = 23
          TabOrder = 3
          Text = 'ConnectWillMessageEdit'
        end
        object ConnectWillActiveCheckBox: TCheckBox
          Left = 411
          Top = 70
          Width = 62
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Active'
          TabOrder = 4
        end
        object ConnectCredentialsActiveCheckBox: TCheckBox
          Left = 661
          Top = 70
          Width = 62
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Active'
          TabOrder = 5
        end
        object ConnectUsernameEdit: TEdit
          Left = 707
          Top = 9
          Width = 200
          Height = 23
          TabOrder = 6
          Text = 'ConnectUsernameEdit'
        end
        object ConnectPasswordEdit: TEdit
          Left = 707
          Top = 38
          Width = 200
          Height = 23
          TabOrder = 7
          Text = 'ConnectPasswordEdit'
        end
        object ConnectClientIdentifierEdit: TEdit
          Left = 212
          Top = 9
          Width = 157
          Height = 23
          TabOrder = 8
          Text = 'ConnectClientIdentifierEdit'
        end
        object DisconnectPacketSendButton: TButton
          Left = 16
          Top = 39
          Width = 146
          Height = 25
          Caption = 'Send DISCONNECT packet'
          TabOrder = 9
          OnClick = DisconnectPacketSendButtonClick
        end
        object ConnectCleanSessionCheckBox: TCheckBox
          Left = 132
          Top = 69
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Clean session'
          TabOrder = 10
        end
        object ConnectQosComboBox: TComboBox
          Left = 212
          Top = 38
          Width = 157
          Height = 23
          TabOrder = 11
          Text = 'MqttProtocolLevelComboBox'
          Items.Strings = (
            'QoS 0'
            'QoS 1'
            'QoS 2')
        end
      end
      object PingRequestTabSheet: TTabSheet
        Caption = 'PINGREQ'
        ImageIndex = 8
        object PingreqCountLabel: TLabel
          Left = 16
          Top = 46
          Width = 33
          Height = 15
          Caption = 'Count'
        end
        object Label1: TLabel
          Left = 16
          Top = 96
          Width = 58
          Height = 15
          Caption = 'Pause (ms)'
        end
        object PingRequestPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 146
          Height = 25
          Caption = 'Send PINGREQ packet'
          TabOrder = 0
          OnClick = PingRequestPacketSendButtonClick
        end
        object PingreqCountComboBox: TComboBox
          Left = 16
          Top = 67
          Width = 89
          Height = 23
          TabOrder = 1
          Text = 'PingreqCountComboBox'
          Items.Strings = (
            '1'
            '10'
            '100'
            '1000')
        end
        object PingreqPauseMsComboBox: TComboBox
          Left = 16
          Top = 117
          Width = 89
          Height = 23
          TabOrder = 2
          Text = 'PingreqCountComboBox'
          Items.Strings = (
            '0'
            '1'
            '10'
            '100'
            '1000')
        end
      end
      object PublishRequestTabSheet: TTabSheet
        Caption = 'PUBLISH'
        ImageIndex = 3
        DesignSize = (
          933
          168)
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
          Top = 46
          Width = 33
          Height = 15
          Caption = 'Count'
        end
        object PublishPauseMsLabel: TLabel
          Left = 16
          Top = 96
          Width = 58
          Height = 15
          Caption = 'Pause (ms)'
        end
        object PublishPacketSendButton: TButton
          Left = 16
          Top = 8
          Width = 146
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
          Top = 67
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
          Left = 16
          Top = 117
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
    end
  end
  inherited MainPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited MainPageControl: TPageControl
      inherited LogTabSheet: TTabSheet
        inherited LogTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited LogRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited RequestTabSheet: TTabSheet
        inherited RequestTxtRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited RequestHexRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited RequestTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited ResponseTabSheet: TTabSheet
        inherited ResponseHexRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ResponseTxtRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ResponseTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
    end
  end
end
