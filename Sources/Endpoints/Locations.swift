//
//  Locations.swift
//  SwiftInstagram
//
//  Created by Ander Goig on 29/10/17.
//  Copyright © 2017 Ander Goig. All rights reserved.
//

import CoreLocation

extension Instagram {

    // MARK: - Location Endpoints

    /// Get information about a location.
    ///
    /// - parameter locationId: The ID of the location to reference.
    /// - parameter success: The callback called after a correct retrieval.
    /// - parameter failure: The callback called after an incorrect retrieval.
    ///
    /// - important: It requires *public_content* scope.

    public func location(_ locationId: String, success: SuccessHandler<InstagramLocation<String>>?, failure: FailureHandler?) {
        request("/locations/\(locationId)", success: success, failure: failure)
    }

    /// Get a list of recent media objects from a given location.
    ///
    /// - parameter locationId: The ID of the location to reference.
    /// - parameter maxId: Return media after this `maxId`.
    /// - parameter minId: Return media before this `mindId`.
    /// - parameter success: The callback called after a correct retrieval.
    /// - parameter failure: The callback called after an incorrect retrieval.
    ///
    /// - important: It requires *public_content* scope.

    public func recentMedia(forLocation locationId: String,
                            maxId: String? = nil,
                            minId: String? = nil,
                            success: SuccessHandler<[InstagramMedia]>?,
                            failure: FailureHandler?) {
        var parameters = Parameters()

        parameters["max_id"] ??= maxId
        parameters["min_id"] ??= minId

        request("/locations/\(locationId)/media/recent", parameters: parameters, success: success, failure: failure)
    }

    /// Search for a location by geographic coordinate.
    ///
    /// - parameter coordinates: Latitude and longitude of the center search coordinates.
    /// - parameter distance: Default is 500m, max distance is 750.
    /// - parameter facebookPlacesId: Returns a location mapped off of a Facebook places id. If used, `coordinates` is not required.
    /// - parameter success: The callback called after a correct retrieval.
    /// - parameter failure: The callback called after an incorrect retrieval.
    ///
    /// - important: It requires *public_content* scope.

    public func searchLocation(coordinates: CLLocationCoordinate2D? = nil,
                               distance: Int? = nil,
                               facebookPlacesId: String? = nil,
                               success: SuccessHandler<[InstagramLocation<String>]>?,
                               failure: FailureHandler?) {
        var parameters = Parameters()

        parameters["lat"] ??= coordinates?.latitude
        parameters["lng"] ??= coordinates?.longitude
        parameters["distance"] ??= distance
        parameters["facebook_places_id"] ??= facebookPlacesId

        request("/locations/search", parameters: parameters, success: success, failure: failure)
    }

}
