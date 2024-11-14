
# Model Implementation Documentation

## Goals of the model

- Take in an image taken by the camera and return null,
or a bounding box that has been calculated for the image

## CDR

## Current Progress on the model

- Proof of concept model implemented in sauron
  - Hardcoded image file
  - detects baseball players and draws bounding boxes
  - then displays the image with bounding box overlay
- The model is a yolo model in ONNX format
  - This model also had its ONNX Intermediate Representation (IR)
    changed to a lower version

## Brainstorm and Plan for what to do next

### Brainstorm

- Train New Model
  - Make a jupyter notebook for this
- Split the Model Proof of Concept into classification and visualization
