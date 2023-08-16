# Hướng dẫn cài đặt

## Yêu cầu
* Các máy cài đặt phải ra internet trong khi cài đặt lần đầu. Để cài các tools cần thiết(Vd: git, docker, net-tools)

## Chuẩn bị
* Chỉnh sửa lại cấu hình bussystem
* Chỉnh sửa lại cấu hình stack hệ thống trong các file openapi/swarm.dmz.yml openapi/swarm.mid.yml openapi/swarm.tools.yml, và config tương ứng của các service
* Chỉnh sửa lại các script tạo bảng của postgres trong thư mục pg-script
* Chỉnh sửa lại cấu hình deploy hệ thống trong file deployment.env. Lưu ý:
* * Khai lại config MID replicas và config DMZ replicas
* * Các máy được chọn làm leader để tạo cụm swarm thì cần khai đầu tiên (MID_IP_1 hoặc DMZ_IP_1)
* Khai sẵn user readonly/readonly với quyền read cho project config trên git và cho các namespace docker-hub
* Chỉnh sửa lại cấu hình môi trường trong file swarm.env
* Chỉnh sửa lại file add-label.sh để chỉ định các máy chạy các service alone
* Tạo thư mục app với user hiện tại đang dùng

## Cài đặt cụm MID
### Prepare
Chạy lệnh sau trên máy chọn làm LEADER cụm MID. Lưu ý chỉ chạy lần đầu trong trường hợp máy mới dựng.

```
bash mid-prepare-machine.sh
```

Restart lại session ssh hiện tại
### Cài đặt
Chạy lệnh sau trên máy chọn làm LEADER cụm MID.

* Dựng mới lại toàn bộ cụm MID. Bao gồm cả việc: Kéo config deploy về tất cả các máy cụm MID, tạo mới lại swarm MID, login vào docker-hub, start các service cụm MID, start server ftpserver (trên máy Leader), cài đặt service agent portainer, cài đặt portainer admin, cài đặt bussystem

```
bash mid-all-deploy.sh true
```

* Nếu chỉ start lại các service docker 

```
bash mid-all-deploy.sh 
```

* Dựng stack các service cụm MID

```
bash mid-services-deploy.sh
```

* Start ftpserver

```
bash ftpserver/start.sh
```

* Start portainer admin

```
bash portainer-adm-deploy.sh
```

* Start portainer agent

```
bash portainer-agent-deploy.sh
```

* Start bussystem

```
bash mid-bus-deploy.sh
```

## Cài đặt cụm DMZ
### Prepare
Chạy lệnh sau trên máy chọn làm LEADER cụm DMZ. Lưu ý chỉ chạy lần đầu trong trường hợp máy mới dựng.

```
bash dmz-prepare-machine.sh
```

Restart lại session ssh hiện tại

### Cài đặt
Chạy lệnh sau trên máy chọn làm LEADER cụm DMZ.

* Dựng mới lại toàn bộ cụm DMZ. Bao gồm cả việc: Kéo config deploy về tất cả các máy cụm DMZ, tạo mới lại swarm DMZ, add label cho các node DMZ, login vào docker-hub, start các service tools, khởi tạo database postgres, start các service DMZ, start service web, cài đặt service agent portainer

```
bash dmz-all-deploy.sh true
```

* Nếu chỉ start lại các service docker 

```
bash dmz-all-deploy.sh 
```

* start các service tools

```
bash dmz-tools-deploy.sh
```

* Khởi tạo database postgres trong trường hợp lần đầu cài

```
bash dmz-postgres-prepare.sh
```

* start các service DMZ

```
bash dmz-services-deploy.sh
```

* start service web

```
bash dmz-web-deploy.sh
```

* start service webadmin

```
bash admtools-services-deploy.sh
```
## Thao tác khác
* Cài đặt service agent portainer

```
bash portainer-agent-deploy.sh
```

* Kéo config deploy về tất cả các máy mid

```
bash git-pull-mid.sh
```

* Kéo config deploy về tất cả các máy dmz

```
bash git-pull-dmz.sh
```
