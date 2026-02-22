# MelodiESP 🎶

MelodiESP is a smart, DIY connected music box powered by an **ESP32-S3**. It leverages the power of **ESPHome** to provide a seamless high-quality audio experience with both physical tactile controls and a modern web interface.

## ✨ Features

- **High-Fidelity Audio**: Supports **FLAC** and WAV playback with a 48kHz sample rate.
- **Advanced Audio Mixer**: Features a multi-pipeline I2S mixer allowing simultaneous media playback and system announcements.
- **Tactile Interface**: 5 configurable physical buttons for instant music control or soundboard triggers.
- **Integrated Web Dashboard**: A built-in, responsive web interface for remote control and status monitoring.
- **Smart Home Ready**: Native integration with **Home Assistant** via the ESPHome API.
- **Standalone Capability**: Operates independently on your local Wi-Fi without requiring external servers.

## 🚀 Quick Start

1. **Configure Secrets**: Copy `secrets-sample.yaml` to `secrets.yaml` and fill in your Wi-Fi credentials and API keys.
   ```bash
   cp secrets-sample.yaml secrets.yaml
   ```
2. **Install ESPHome**: Ensure you have ESPHome installed in your environment.
3. **Flash Firmware**: Connect your ESP32-S3 and run the following command to compile and upload:
   ```bash
   esphome run melodiesp.yaml
   ```

## 🧩 Architecture

- **Audio Engine**: Powered by the ESP-IDF framework within ESPHome to handle high-performance I2S audio pipelines and mixing.
- **Dynamic Control**: Supports both physical GPIO button interrupts and remote API triggers.
- **Audio Routing**: Direct digital stream to external I2S DACs for maximum sound quality.

## 🛠️ Software Stack

- **ESPHome**: Core firmware framework.
- **ESP-IDF**: Underlying development framework for advanced audio features.
- **I2S Audio Component**: For digital audio output and mixing.
- **Web Server v3**: Provides the local management interface.

## 🎨 Enclosure & 3D Design

The project includes a custom robot-themed enclosure provided as an **OpenSCAD** source:
- **Parametric Source**: `robot.scad` allows you to customize the box size, thickness, and component mounting by adjusting variables in the file.
- **Parts Included**: The script generates both the **Front Panel** (with speaker grid and button holes) and the **Back Panel** (with standoffs).
- **How to Export**: Open `robot.scad` in [OpenSCAD](https://openscad.org/), adjust the `part_to_show` variable to select a part, then render (F6) and export as STL or 3MF for printing.

## 🏠 Home Assistant Integration

MelodiESP is designed for deep integration with Home Assistant:
- **Music Assistant**: It is recommended use [Music Assistant](https://music-assistant.io/) to manage the media player. The ESP32-S3 will appear as an ESPHome media player which can be added as a player in Music Assistant for high-quality streaming (FLAC support).
- **Automations**: You can trigger complex automations based on the physical button presses (e.g., specific playlists or TTS announcements).

## 🔌 Hardware Requirements

- **Microcontroller**: ESP32-S3 (N16R8 recommended for PSRAM support).
- **Audio**: External I2S DAC/Amplifier (e.g., MAX98357A, PCM5102).
- **Controls**: 5x Momentary Push Buttons.
- **Power**: Stable 5V power supply.

---
*Powered by ESPHome.*