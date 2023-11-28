// WARNING: Please don't edit this file. It was generated by C++/WinRT v2.0.220418.1

#pragma once
#ifndef WINRT_Windows_Devices_Pwm_2_H
#define WINRT_Windows_Devices_Pwm_2_H
#include "winrt/impl/Windows.Devices.Pwm.Provider.1.h"
#include "winrt/impl/Windows.Foundation.1.h"
#include "winrt/impl/Windows.Devices.Pwm.1.h"
WINRT_EXPORT namespace winrt::Windows::Devices::Pwm
{
    struct __declspec(empty_bases) PwmController : winrt::Windows::Devices::Pwm::IPwmController
    {
        PwmController(std::nullptr_t) noexcept {}
        PwmController(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Devices::Pwm::IPwmController(ptr, take_ownership_from_abi) {}
        static auto GetControllersAsync(winrt::Windows::Devices::Pwm::Provider::IPwmProvider const& provider);
        static auto GetDefaultAsync();
        static auto GetDeviceSelector();
        static auto GetDeviceSelector(param::hstring const& friendlyName);
        static auto FromIdAsync(param::hstring const& deviceId);
    };
    struct __declspec(empty_bases) PwmPin : winrt::Windows::Devices::Pwm::IPwmPin
    {
        PwmPin(std::nullptr_t) noexcept {}
        PwmPin(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Devices::Pwm::IPwmPin(ptr, take_ownership_from_abi) {}
    };
}
#endif
