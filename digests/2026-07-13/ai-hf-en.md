# Hugging Face Trending Models Digest 2026-07-13

> Source: [Hugging Face Hub](https://huggingface.co/) | 30 models | Generated: 2026-07-13 05:45 UTC

---

### 1. Today's Highlights

The Hugging Face ecosystem is witnessing a surge in both general-purpose and specialized AI models, led by **zai-org's GLM-5.2**, which has topped the charts with nearly 4,000 likes, signaling a major leap in conversational capabilities. **NVIDIA** continues to dominate the technical landscape with high-utility multimodal models like **LocateAnything-3B** and **Unlimited-OCR**, catering to enterprise-grade vision and document processing needs. Meanwhile, the community is heavily favoring the **Qwen3.6** family, evidenced by numerous fine-tunes and quantizations, alongside a persistent trend toward **GGUF** formats for local, low-resource deployment.

### 2. Trending Models

#### 🧠 Language Models (LLMs, chat models, instruction-tuned)
*   **zai-org/GLM-5.2**
    *   **Author:** zai-org | **Likes:** 3,862 | **Downloads:** 441,413
    *   **Summary:** A powerful conversational text-generation model utilizing GLM Moe DSA architecture, currently the most popular model on the hub.
*   **InternScience/Agents-A1**
    *   **Author:** InternScience | **Likes:** 511 | **Downloads:** 29,038
    *   **Summary:** A Qwen3.5 MoE model designed for agentic workflows, bridging the gap between text generation and image-text understanding.
*   **deepreinforce-ai/Ornith-1.0-35B-GGUF**
    *   **Author:** deepreinforce-ai | **Likes:** 856 | **Downloads:** 1,347,036
    *   **Summary:** A 35B parameter model quantized for local use, trending due to its high compatibility and utility for local deployments.
*   **SupraLabs/Supra-Router-51M**
    *   **Author:** SupraLabs | **Likes:** 108 | **Downloads:** 1,434
    *   **Summary:** A lightweight router model designed to facilitate efficient model orchestration and routing in complex AI systems.

#### 🎨 Multimodal & Generation (image, video, audio, text-to-X)
*   **nvidia/LocateAnything-3B**
    *   **Author:** nvidia | **Likes:** 2,717 | **Downloads:** 1,501,653
    *   **Summary:** A robust vision-language model from NVIDIA excelling in locating objects within images, combining high popularity with massive downloads.
*   **baidu/Unlimited-OCR**
    *   **Author:** baidu | **Likes:** 1,947 | **Downloads:** 1,430,656
    *   **Summary:** A high-performance OCR tool capable of handling unlimited text extraction tasks, essential for document analysis workflows.
*   **empero-ai/Qwythos-9B-Claude-Mythos-5-1M-GGUF**
    *   **Author:** empero-ai | **Likes:** 2,051 | **Downloads:** 1,967,677
    *   **Summary:** A highly quantized image-text-to-text model tailored for complex reasoning tasks, outperforming many larger models in local benchmarks.
*   **open-gigaai/Giga-World-1**
    *   **Author:** open-gigaai | **Likes:** 124 | **Downloads:** 0
    *   **Summary:** A diffusion model focused on regional generation, operating on US-based infrastructure.
*   **robbyant/lingbot-world-v2-14b-causal-fast**
    *   **Author:** robbyant | **Likes:** 87 | **Downloads:** 0
    *   **Summary:** An image-to-video model capable of generating "World Model" simulations from static images.
*   **Alissonerdx/LTX-Best-Face-ID**
    *   **Author:** Alissonerdx | **Likes:** 116 | **Downloads:** 0
    *   **Summary:** A specialized video generation model focused on high-fidelity identity preservation and reference-to-video synthesis.

#### 🔧 Specialized Models (code, math, medical, embeddings)
*   **google/tabfm-1.0.0-pytorch**
    *   **Author:** google | **Likes:** 357 | **Downloads:** 20,973
    *   **Summary:** Google's Tabular Forecasting Model designed for zero-shot tabular regression and classification tasks.
*   **CohereLabs/cohere-transcribe-arabic-07-2026**
    *   **Author:** CohereLabs | **Likes:** 96 | **Downloads:** 9,860
    *   **Summary:** An automatic speech recognition (ASR) model specifically fine-tuned for high-accuracy Arabic transcription.
*   **nineninesix/gepard-1.0**
    *   **Author:** nineninesix | **Likes:** 87 | **Downloads:** 2,263
    *   **Summary:** A text-to-speech model leveraging Qwen3.5 architecture for high-quality voice synthesis.

#### 📦 Fine-tunes & Quantizations (community fine-tunes, GGUF, AWQ)
*   **HauhauCS/Qwen3.6-35B-A3B-Uncensored-HauhauCS-Aggressive**
    *   **Author:** HauhauCS | **Likes:** 2,684 | **Downloads:** 2,596,384
    *   **Summary:** A highly popular uncensored, aggressive fine-tune of Qwen3.6 in GGUF format, popular among users seeking unrestricted chat capabilities.
*   **unsloth/Qwen3.6-27B-MTP-GGUF**
    *   **Author:** unsloth | **Likes:** 1,063 | **Downloads:** 2,905,019
    *   **Summary:** An efficient, token-efficient thinking model quantized for GGUF, optimized for reasoning tasks on consumer hardware.
*   **bottlecapai/ThinkingCap-Qwen3.6-27B-GGUF**
    *   **Author:** bottlecapai | **Likes:** 85 | **Downloads:** 312,299
    *   **Summary:** A token-efficient variant of the ThinkingCap model, focusing on "efficient thinking" for local inference.
*   **unsloth/Qwen3.6-27B-NVFP4**
    *   **Author:** unsloth | **Likes:** 180 | **Downloads:** 1,378,663
    *   **Summary:** A quantized model using NVIDIA's FP4 format, designed to maximize throughput and memory efficiency on NVIDIA GPUs.

### 3. Ecosystem Signal

The current ecosystem is dominated by the **GLM** and **Qwen3.6** families, suggesting a consolidation around open-weight models that offer strong performance without the cost of proprietary APIs. There is a distinct bifurcation in user preference: enterprise and research sectors are flocking to specialized, high-performance models like NVIDIA's LocateAnything and Baidu's OCR, while individual developers and hobbyists are overwhelmingly favoring **GGUF** and **NVFP4** quantizations for local deployment. The rise of "agentic" models and "uncensored" fine-tunes indicates a shift toward more autonomous, tool-using AI agents capable of handling complex, multi-step reasoning tasks.

### 4. Worth Exploring

*   **zai-org/GLM-5.2** ([Link](https://huggingface.co/zai-org/GLM-5.2)): Given its massive popularity and high download count, this is the best entry point for general-purpose conversational AI at this moment.
*   **nvidia/LocateAnything-3B** ([Link](https://huggingface.co/nvidia/LocateAnything-3B)): A powerful example of how specialized multimodal models are outperforming generalists in specific vision tasks like object localization and feature extraction.
*   **unsloth/Qwen3.6-27B-MTP-GGUF** ([Link](https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF)): For users with limited GPU VRAM, this model offers a rare combination of "efficient thinking" and high performance in a quantized format.