#include <iostream>
#include <sdrplay_api.h>

int main() {
  sdrplay_api_ErrT err = sdrplay_api_Open();
  if (err != sdrplay_api_Success) {
    std::cout << "Error initializing API: " << sdrplay_api_GetErrorString(err)
              << std::endl;
  }
  float ver;
  err = sdrplay_api_ApiVersion(&ver);
  if (err != sdrplay_api_Success) {
    std::cout << "Error checking API version: "
              << sdrplay_api_GetErrorString(err) << std::endl;
  } else {
    std::cout << "API version: " << ver << std::endl;
  }

  unsigned int ndevices = SDRPLAY_MAX_DEVICES;
  sdrplay_api_DeviceT devices[SDRPLAY_MAX_DEVICES];
  err = sdrplay_api_GetDevices(devices, &ndevices, ndevices);
  if (err != sdrplay_api_Success) {
    std::cout << "Error getting devices: " << sdrplay_api_GetErrorString(err)
              << std::endl;
  } else {
    std::cout << "Num devices found: " << ndevices << std::endl;
  }
  err = sdrplay_api_Close();
  if (err != sdrplay_api_Success) {
    std::cout << "Error closing API: " << sdrplay_api_GetErrorString(err)
              << std::endl;
  }
}
