This is an automation repository of the project.

                 GITHUB
                   │
        ┌──────────┴──────────┐
        │                     │
        ▼                     ▼
 envimo401_bringup      envimo401_chassis
        │                     │
        └──────────┬──────────┘
                   │
                   │ checkout
                   ▼
        ┌───────────────────────┐
        │ GitHub Actions Runner │
        │                       │
        │ automation/           │
        │ ├── Dockerfile        │
        │ ├── start.sh          │
        │ └── ros2_ws/src/      │
        │     ├── bringup       │
        │     └── chassis       │
        └───────────┬───────────┘
                    │
                    │ docker build
                    ▼
        ┌───────────────────────┐
        │     DOCKER IMAGE      │
        │       ARM64           │
        │                       │
        │ ROS 2 Jazzy           │
        │                       │
        │ /ros2_ws/src          │
        │ /ros2_ws/build        │
        │ /ros2_ws/install      │
        │                       │
        │ dependencies          │
        │ libraries             │
        │ environment variables │
        └───────────┬───────────┘
                    │
                    │ approval
                    ▼
              Docker Hub
                    │
                    │ pull
                    ▼
             Raspberry Pi 5