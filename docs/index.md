# Feonix Documentation

## Feonix Use Case Diagram

<!-- markdownlint-disable line-length -->

```plantuml
@startuml

left to right direction

actor GNC
actor User

package Dad {
    usecase "Check Range" as CR
    usecase "Boot Dad" as BootDad
    usecase "Inform Sauron to End Mapping" as DadEndMap
}

package Sauron {
    usecase "Detect Target" as DT
    usecase "Image Stitching" as IS
    usecase "Boot Sauron" as BootSauron
    usecase "Finalize Map" as FinalMap
    usecase "Calculate Target Coordinates" as CalcTargCoord
}

package CameraThread {
    usecase "Start Recording" as StartR
    usecase "Stop Recording" as StopR
    usecase "Image Captured" as IC
    usecase "Boot Camera Thread" as BootCameraThread
}

package Mailbox {
    usecase "Send Telemetry Home" as SendHome
}

package Home {
    usecase "Display Telemetry" as DisplayTelem
}

package Mom {
    usecase Wakeup
}

' GNC actor arrows
GNC --> DadEndMap : End of Mapping
GNC --> CR : Coordinates

' DAD system arrows
CR --> StartR
CR --> StopR
DadEndMap --> FinalMap
CR --> SendHome : State & Coordinates

' Camera Thread system arrows
IC --> DT : If Target
IC --> IS : If Map

' Sauron system arrows
FinalMap --> SendHome
DT --> CalcTargCoord
DT --> SendHome: Target Found
CalcTargCoord --> GNC

' Mailbox system arrows
SendHome --> DisplayTelem

' Home system

User --> Wakeup

' Mom system arrows
Wakeup --> BootCameraThread
Wakeup --> BootSauron
Wakeup --> BootDad


@enduml
```

<!-- markdownlint-enable line-length -->

## ODLC Sequence Diagram

```plantuml
@startuml

participant GNC
participant Dad
participant Camera_Process
participant Sauron

GNC -> Dad: GPS Coordinates
Dad -> Dad: GPS airdrop boundary
Dad -> Camera_Process: Start Recording
Camera_Process -> Sauron: Detect Targets
Sauron -> Sauron: Localize Targets
GNC <- Sauron: Drop Coordinates
@enduml
```

## Image Mapping Sequence Diagram

```plantuml
@startuml

participant GNC
participant Dad
participant Camera_Process
participant Sauron
participant Mailbox
actor Groundstation

GNC -> Dad: GPS coordinates
Dad -> Dad: GPS in mapping boundaries
Dad -> Camera_Process: Start recording
Camera_Process -> Sauron: Create image map
GNC -> Sauron: Stop making map
Sauron -> Mailbox: Send image map
Mailbox -> Groundstation: Display image map
@enduml
```

## Professional ODLC Sequence Diagram

```plantuml
@startuml

participant GNC
participant Manager
participant Camera_Controller
participant Image_Processor

GNC -> Manager: GPS Coordinates
Manager -> Manager: GPS airdrop boundary
Manager -> Camera_Controller: Start Recording
Camera_Controller -> Image_Processor: Detect Targets
Image_Processor -> Image_Processor: Localize Targets
GNC <- Image_Processor: Drop Coordinates
@enduml
```

## Professional Image Mapping Sequence Diagram

```plantuml
@startuml

participant GNC
participant Manager
participant Camera_Controller
participant Image_Processor
participant Mailbox
actor Groundstation

GNC -> Manager: GPS coordinates
Manager -> Manager: GPS in mapping boundaries
Manager -> Camera_Controller: Start recording
Camera_Controller -> Image_Processor: Create image map
GNC -> Image_Processor: Stop making map
Image_Processor -> Mailbox: Send image map
Mailbox -> Groundstation: Display image map
@enduml
```
