# etrip

- [x] frontend  https://github.com/TomerconDevelopers/etrip/tree/frontend
- [x] backend https://github.com/TomerconDevelopers/etrip/tree/backend
- [ ] production `soon`
## Getting Started

### Backend : Development Server
 
  ### Admin
 - admin : https://admin.etrip.ml/y42rhXWHCYGcfu6g3uqR7vkxqQZ7G5gt/
 - username : `admin`
 - password : `12345`
 
  ### API
  - api host : https://api.etrip.ml/
  - endpoints : `v1/*`
  
  
- [x] development server
- [ ] api endpoints
  - [x] host : https://api.etrip.ml/
  - [x] `v1/token`
  - [x] `v1/token/refresh`
  - [x] `v1/refresh/`
  - [x] `v1/user/registration`
  - [x] `v1/driver/registration/basic`
  - [x] `v1/driver/registration/docs`
  - [x] `v1/driver/vehicles/registration`
  - [x] `v1/driver/vehicles/listed`
  - [x] `v1/driver/vehicles`
  - [x] `v1/user/trips/create
  - [ ] `v1/user/trips/cancel`
  - [ ] `v1/driver/trips/bid`
  - [ ] `v1/user/bids/select`
  - [ ] `v1/notifications
  - [ ] `v1/user/trips/active`
  - [ ] `v1/user/trips/previous`
  - [ ] `v1/driver/bids/active`
  - [ ] `v1/driver/bids/previous`
  - [ ] `v1/user/profile/update`
  - [ ] `v1/driver/profile/update`
  - [ ] ...


## Enable GeoDjango

### System Config :- 

#### Installing GeoDjango Dependencies (GEOS, GDAL, and PROJ.4)
 
 - [x] `sudo aptitude install gdal-bin libgdal-dev`
 - [x] `sudo aptitude install python3-gdal`
 - [x] `sudo aptitude install binutils libproj-dev`

#### Up postgres DB
 
 - [x] `docker run --name=postgis -d -e POSTGRES_USER=user001 -e POSTGRES_PASS=123456789 -e POSTGRES_DBNAME=gis -p 5432:5432 kartoza/postgis:9.6-2.4`


### App Config

```
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'gis',
        'USER': 'user001',
        'PASSWORD': '123456789',
        'HOST': 'localhost',
        'PORT': '5432'
    }
}

```

- [x] `DATABASE_URL = postgis://user001:123456789@localhost:5432/gis`

### Development Server Config
- [x] `heroku config:set DATABASE_URL="postgis://<username>:<password>@<host>:<port>/<database>?postgis_extension=true&search_schema_path=public,postgis"`
