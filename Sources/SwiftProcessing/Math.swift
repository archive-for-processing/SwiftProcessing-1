//
//  Math.swift
//  
//
//  Created by Vasilis Akoinoglou on 31/7/20.
//

import Foundation
import simd
import GameKit

//MARK: - Calculation

// Already provided by the system
// abs()
// ceil()
// exp()
// floor()
// log()
// max()
// min()
// pow()
// round()
// sqrt()

public func constrain(_ amt: CGFloat, _ low: CGFloat, _ high: CGFloat) -> CGFloat {
    min(max(amt, low), high)
}

public func dist(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat) -> CGFloat {
    sqrt(sq(x2 - x1) + sq(y2 - y1))
}


public func lerp(_ start: CGFloat, _ stop: CGFloat, _ amt: CGFloat) -> CGFloat {
    let f = constrain(amt, 0, 1)
    return start + (stop - start) * f
}

public func mag(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat) -> CGFloat {
    CGFloat(PVector(Double(a), Double(b), Double(c)).mag())
}

public func map(_ value: CGFloat, _ minRange: CGFloat, _ maxRange: CGFloat, _ minDomain: CGFloat, _ maxDomain: CGFloat) -> CGFloat {
    minDomain + (maxDomain - minDomain) * (value - minRange) / (maxRange - minRange)
}


public func norm(_ value: CGFloat, _ start: CGFloat, _ stop: CGFloat) -> CGFloat {
    map(value, start, stop, 0, 1)
}

public func sq(_ n: CGFloat) -> CGFloat {
    pow(n, 2)
}


//MARK: - Trigonometry

// Already provided by the system

// acos()
// asin()
// atan()
// atan2()
// cos()
// sin()
// tan()


public func degrees(_ radians: CGFloat) -> CGFloat {
    radians * 180 / .pi
}

public func radians(_ degrees: CGFloat) -> CGFloat {
    degrees * .pi / 180
}

//MARK: - Constants

public let HALF_PI    = CGFloat.pi / 2.0
public let PI         = CGFloat.pi
public let TWO_PI     = CGFloat.pi * 2.0
public let TAU        = CGFloat.pi * 2.0
public let QUARTER_PI = CGFloat.pi / 4.0

//MARK: - Random

public func random(_ n: CGFloat) -> CGFloat {
    let r: Int = random(n)
    return CGFloat(r)
}

public func random(_ n: CGFloat) -> Int {
    Int(arc4random_uniform(UInt32(n)))
}

public func random(_ n: Int) -> Int {
    Int(arc4random_uniform(UInt32(n)))
}

public func random(_ min: Int, _ max: Int) -> CGFloat {
    let r: Int = random(min, max)
    return CGFloat(r)
}

public func random(_ min: Int, _ max: Int) -> Int {
    Int(arc4random_uniform(UInt32(max - min))) + min
}

/*
public func random(_ low: CGFloat, _ high: CGFloat) -> CGFloat {
    CGFloat(GKRandomDistribution(randomSource: randomSource, lowestValue: Int(low), highestValue: Int(high)).nextUniform())
}

public func random(_ n: CGFloat) -> Int {
    Int(random(0, n))
}

public func random(_ n: CGFloat) -> CGFloat {
    random(0, n)
}

public func random(_ n: Int) -> Int {
    Int(random(0, CGFloat(n)))
}

private var randomSeed: UInt64?
private let randomSource: GKRandomSource = {
    guard let seed = randomSeed else {
        return GKARC4RandomSource()
    }
    return GKMersenneTwisterRandomSource(seed: seed)
}()
*/

private let gaussianRandomSource = GKRandomSource()
private let gaussianDistribution = GKGaussianDistribution(randomSource: gaussianRandomSource, mean: 0, deviation: 1)

public func randomGaussian() -> CGFloat {
    CGFloat(gaussianDistribution.nextUniform())
}
