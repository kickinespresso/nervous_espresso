# NervousEspresso

**TODO: Add description**


export MIX_TARGET=rpi3
MIX_ENV=prod mix release --env=prod
MIX_TARGET=rpi3 mix firmware  --env=prod
MIX_TARGET=rpi3 mix firmware.burn --env=prod
MIX_TARGET=rpi3 MIX_ENV=prod mix release
MIX_TARGET=rpi3 MIX_ENV=prod mix firmware
MIX_TARGET=rpi3 MIX_ENV=prod mix firmware.burn



# Build Dev and burn
MIX_TARGET=rpi3 mix release
MIX_TARGET=rpi3 mix firmware
MIX_TARGET=rpi3 mix firmware.burn
