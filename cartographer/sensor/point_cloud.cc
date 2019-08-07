/*
 * Copyright 2016 The Cartographer Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "cartographer/sensor/point_cloud.h"

#include "cartographer/sensor/proto/sensor.pb.h"
#include "cartographer/transform/transform.h"

namespace cartographer {
namespace sensor {

  using Vector = Eigen::Matrix<float, 3, 1>;
  using Quaternion = Eigen::Quaternion<float>;

PointCloud TransformPointCloud(const PointCloud& point_cloud,
                               const transform::Rigid3f& transform) {
  PointCloud result;
  result.reserve(point_cloud.size());
  for (const RangefinderPoint& point : point_cloud) {
    result.emplace_back(transform * point);
  }
  return result;
}

TimedPointCloud TransformTimedPointCloud(const TimedPointCloud& point_cloud,
                                         const transform::Rigid3f& transform) {
  TimedPointCloud result;
  result.reserve(point_cloud.size());
  for (const TimedRangefinderPoint& point : point_cloud) {
    result.push_back(transform * point);
  }
  return result;
}

TimedPointCloud TransformTimedPointCloud(const TimedPointCloud& point_cloud,
                                         const transform::Rigid3d& transform) {
  // Convert Rigid3d to Rigid3f
  auto translation = transform.translation();
  auto rotation    = transform.rotation();
  Vector float_translation{static_cast<float>(translation.x()), static_cast<float>(translation.y()), static_cast<float>(translation.z())};
  Quaternion float_rotation{static_cast<float>(rotation.w()), static_cast<float>(rotation.x()), static_cast<float>(rotation.y()), static_cast<float>(rotation.z())};
  transform::Rigid3f float_tf{float_translation, float_rotation};
  return TransformTimedPointCloud(point_cloud, float_tf);
}

PointCloud CropPointCloud(const PointCloud& point_cloud, const float min_z,
                          const float max_z) {
  PointCloud cropped_point_cloud;
  for (const RangefinderPoint& point : point_cloud) {
    if (min_z <= point.position.z() && point.position.z() <= max_z) {
      cropped_point_cloud.push_back(point);
    }
  }
  return cropped_point_cloud;
}

TimedPointCloud CropTimedPointCloud(const TimedPointCloud& point_cloud,
                                    const float min_z, const float max_z) {
  TimedPointCloud cropped_point_cloud;
  for (const TimedRangefinderPoint& point : point_cloud) {
    if (min_z <= point.position.z() && point.position.z() <= max_z) {
      cropped_point_cloud.push_back(point);
    }
  }
  return cropped_point_cloud;
}

}  // namespace sensor
}  // namespace cartographer
