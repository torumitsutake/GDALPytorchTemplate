import os
import torch
from samgeo import SamGeo, tms_to_geotiff

bbox = [-95.3704, 29.6762, -95.368, 29.6775]
image = 'satellite.tif'
tms_to_geotiff(output=image, bbox=bbox, zoom=20, source='Satellite', overwrite=True)

# model_dir = os.path.join('./', 'models')
# checkpoint = os.path.join(model_dir, 'sam_vit_h_4b8939.pth')

# device = 'cuda' if torch.cuda.is_available() else 'cpu'
# sam = SamGeo(
#     checkpoint=checkpoint,
#     model_type='vit_h',
#     device=device,
#     erosion_kernel=(3, 3),
#     mask_multiplier=255,
#     sam_kwargs=None,
# )

# mask = 'segment.tif'
# sam.generate(image, mask)

# vector = 'segment.gpkg'
# sam.tiff_to_gpkg(mask, vector, simplify_tolerance=None)
