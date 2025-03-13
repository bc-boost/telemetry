codeunit 50600 "AFI. Telemetry Management"
{

    procedure LogMessage(EventID: Text; Message: Text; VerbosityParam: Verbosity; DataClassificationParam: DataClassification; Scope: TelemetryScope)
    var
    begin
        Session.LogMessage(
                    EventID,
                    Message,
                    VerbosityParam,
                    DataClassificationParam,
                    Scope,
                    ParametersDictionary
                );
    end;

    procedure LogMessage(EventID: Text; Message: Text)
    var
    begin
        LogMessage(EventID, Message, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::All);
    end;

    procedure ClearParameters()
    var
    begin
        Clear(ParametersDictionary);
    end;

    procedure AddParameter(KeyVal: Text; Value: Text)
    var
    begin
        ParametersDictionary.Add(KeyVal, Value);
    end;

    procedure EditParameter(KeyVal: Text; Value: Text)
    var
    begin
        if ParametersDictionary.ContainsKey(KeyVal) then
            ParametersDictionary.Remove(KeyVal);

        ParametersDictionary.Add(KeyVal, Value);
    end;

    var
        ParametersDictionary: Dictionary of [Text, Text];

}