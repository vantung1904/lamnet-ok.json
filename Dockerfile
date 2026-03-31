# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow lists custom nodes in an unknown registry, but no aux_id (GitHub repo) or registry ID was provided for them.
# Therefore these nodes cannot be automatically installed or cloned. Please provide registry IDs or GitHub repos for these nodes so they can be installed.
# Skipping unresolved custom nodes:
# - Image Comparer (rgthree)  -> no aux_id or registry ID provided
# - SeedVR2LoadDiTModel     -> no aux_id or registry ID provided
# - SeedVR2LoadVAEModel     -> no aux_id or registry ID provided
# - SeedVR2VideoUpscaler    -> no aux_id or registry ID provided
# - SplitImageWithAlpha     -> no aux_id or registry ID provided
# - JoinImageWithAlpha      -> no aux_id or registry ID provided
# - easy cleanGpuUsed       -> no aux_id or registry ID provided
# - JWImageResizeByLongerSide -> no aux_id or registry ID provided
# - Image Comparer (rgthree) (duplicate) -> no aux_id or registry ID provided
# - Image Comparer (rgthree) (duplicate) -> no aux_id or registry ID provided

# download models into comfyui
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/blob/main/seedvr2_ema_7b_sharp_fp16.safetensors --relative-path models/diffusion_models --filename seedvr2_ema_7b_sharp_fp16.safetensors
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/blob/main/ema_vae_fp16.safetensors --relative-path models/vae --filename ema_vae_fp16.safetensors
# RUN # Could not find URL for <none>  # (all required model URLs were found)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
