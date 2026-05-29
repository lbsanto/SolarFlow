$ContainerName = "energy-app"
$ImageName = "energy-app"

function Show-Help {
    Write-Host "Usage: .\startbuild.ps1 {build|start|stop|remove|help}"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  build   - Stop container and build image"
    Write-Host "  start   - Create if not exists and start container"
    Write-Host "  stop    - Stop container if running"
    Write-Host "  remove  - Remove container and image"
    Write-Host "  help    - Show help"
}

switch ($args[0]) {

    "build" {
        Write-Host "Stopping container (if exists)..."
        docker stop $ContainerName 2>$null
        docker rm $ContainerName 2>$null

        Write-Host "Building image..."
        docker build --no-cache -t $ImageName -f deploy/Dockerfile .
    }

    "remove" {
        Write-Host "Stopping container..."
        docker stop $ContainerName 2>$null

        Write-Host "Removing container..."
        docker rm $ContainerName 2>$null

        Write-Host "Removing image..."
        docker rmi $ImageName 2>$null
    }

    "start" {
        $exists = docker ps -a --format "{{.Names}}" | Select-String "^$ContainerName$"

        if ($exists) {
            Write-Host "Container exists. Starting..."
            docker start $ContainerName
        }
        else {
            Write-Host "Creating container..."
            docker run -d `
                --name $ContainerName `
                -p 80:80 `
                -p 8089:8089 `
                $ImageName

            Write-Host "Starting container..."
            docker start $ContainerName
        }
    }

    "stop" {
        $exists = docker ps -a --format "{{.Names}}" | Select-String "^$ContainerName$"

        if ($exists) {
            Write-Host "Stopping container..."
            docker stop $ContainerName
        }
        else {
            Write-Host "Container does not exist."
        }
    }

    default {
        Show-Help
    }
}
