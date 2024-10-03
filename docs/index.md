# Feonix Documentation

The chosen documentation system is based on:

- [mkdocs](https://www.mkdocs.org/)
- [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
- [mkdocs-with-pdf](https://github.com/orzih/mkdocs-with-pdf)
- [plantuml](https://plantuml.com/)
- [plantuml-markdown](https://github.com/mikitex70/plantuml-markdown)
- [C4-plantuml](https://github.com/plantuml-stdlib/C4-PlantUML)
- [plantuml-icon-font-sprites](https://github.com//tupadr3/plantuml-icon-font-sprites)

## Architecture

The following architecture diagrams describe the example project system as a
whole and its individual components on different context layers following the
known [C4 Model](https://c4model.com/) for architecture diagrams.

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
