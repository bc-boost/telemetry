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
        if ParametersDictionary.ContainsKey(TelemetrySessionIdLbl) then
            ParametersDictionary.Remove(TelemetrySessionIdLbl);

        AddParameter(TelemetrySessionIdLbl, CurrSessionId);
        LogMessage(EventID, Message, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::All);
    end;

    procedure ClearParameters()
    var
    begin
        Clear(ParametersDictionary);
    end;

    procedure AddParameter(KeyVal: Text; Value: Variant)
    var
    begin
        ParametersDictionary.Add(KeyVal, Format(Value));
    end;

    procedure EditParameter(KeyVal: Text; Value: Text)
    var
    begin
        if ParametersDictionary.ContainsKey(KeyVal) then
            ParametersDictionary.Remove(KeyVal);

        ParametersDictionary.Add(KeyVal, Value);
    end;

    procedure Initialize()
    var
    begin
        CurrSessionId := CreateGuid();
    end;

    var
        ParametersDictionary: Dictionary of [Text, Text];
        CurrSessionId: Guid;
        TelemetrySessionIdLbl: Label 'TelemetrySessionId', Locked = true;
}