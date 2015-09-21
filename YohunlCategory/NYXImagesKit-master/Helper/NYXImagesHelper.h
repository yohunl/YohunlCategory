//
//  NYXImagesHelper.h
//  NYXImagesKit
//
//  Created by Matthias Tretter on 02/06/11.
//  Originally Created by @Nyx0uf on 02/05/11.
//  Copyright 2012 Benjamin Godard. All rights reserved.
//  www.cococabyss.com
//
#import <UIKit/UIKit.h>

/* Number of components for an opaque grey colorSpace = 3 */
#define kNyxNumberOfComponentsPerGreyPixel 3
/* Number of components for an ARGB pixel (Alpha / Red / Green / Blue) = 4 */
#define kNyxNumberOfComponentsPerARBGPixel 4
/* Minimun value for a pixel component */
#define kNyxMinPixelComponentValue (UInt8)0
/* Maximum value for a pixel component */
#define kNyxMaxPixelComponentValue (UInt8)255

/* Convert degrees value to radians */
#define NYX_DEGREES_TO_RADIANS(__DEGREES) (__DEGREES * 0.017453293) // (M_PI / 180.0f)
/* Convert radians value to degrees */
#define NYX_RADIANS_TO_DEGREES(__RADIANS) (__RADIANS * 57.295779513) // (180.0f / M_PI)

/* Returns the lower value */
#define NYX_MIN(__A, __B) ((__A) < (__B) ? (__A) : (__B))
/* Returns the higher value */
#define NYX_MAX(__A ,__B) ((__A) > (__B) ? (__A) : (__B))
/* Returns a correct value for a pixel component (0 - 255) */
#define NYX_SAFE_PIXEL_COMPONENT_VALUE(__COLOR) (NYX_MIN(kNyxMaxPixelComponentValue, NYX_MAX(kNyxMinPixelComponentValue, __COLOR)))

/* iOS version runtime check */
#define NYX_IOS_VERSION_LESS_THAN(__VERSIONSTRING) ([[[UIDevice currentDevice] systemVersion] compare:__VERSIONSTRING options:NSNumericSearch] == NSOrderedAscending)

CGContextRef NYXCreateARGBBitmapContext(const size_t width, const size_t height, const size_t bytesPerRow);
CGImageRef NYXCreateGradientImage(const size_t pixelsWide, const size_t pixelsHigh, const CGFloat fromAlpha, const CGFloat toAlpha);
CIContext* NYXGetCIContext(void);
CGColorSpaceRef NYXGetRGBColorSpace(void);
void NYXImagesKitRelease(void);