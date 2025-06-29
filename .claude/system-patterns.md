# System Patterns: Word-Tree Architecture

## Core Architectural Patterns

### 1. Graph-Native Neural Networks
**Pattern**: Treat neural computation as operations on graph structures rather than matrix operations
- **Nodes**: Represent subword tokens with complex tensor embeddings
- **Edges**: Store contextual weights that evolve during training
- **Traversal**: Inference follows paths through the graph structure
- **Benefits**: Natural interpretability, sparse computation, dynamic structure

### 2. Complex Tensor Mathematics
**Pattern**: Use complex numbers (polar form) instead of real-valued vectors
- **Representation**: [theta, magnitude] pairs with discrete quantization
- **Alignment Scoring**: `cos(theta_diff) * (mag1 + mag2)` for compatibility
- **Advantages**: More expressive than real numbers, natural phase relationships
- **Implementation**: Custom ComplexTensor class with bounded operations

### 3. Context Propagation System
**Pattern**: Dynamic context flow through graph connections
- **Threshold Activation**: Only propagate when alignment > 0.1
- **Context Evolution**: Running context updated based on path traversal
- **Bounded Updates**: Prevent exploding gradients through magnitude limits
- **Selective Flow**: Context flows only through relevant connections

### 4. Contrastive Learning Framework
**Pattern**: Learn through discrimination between positive and negative examples
- **Binary Classification**: Target vs negative sample comparison
- **Balanced Sampling**: Equal positive and negative examples
- **Loss Function**: Binary cross-entropy with alignment scores
- **Training Stability**: More stable than generative loss functions

## Component Relationships

### Version 2 Architecture Flow
```
Subword Tokenizer → Graph Nodes → Complex Tensors → Context Propagation → Training/Inference
```

### Key Dependencies
- **Neo4j**: Graph storage and retrieval
- **Complex Tensors**: Core mathematical foundation
- **BPE Tokenization**: Subword vocabulary management
- **Beam Search**: Inference strategy

## Critical Implementation Paths

### Training Pipeline
1. **Tokenization**: Text → BPE subwords
2. **Graph Construction**: Create/update nodes for new subwords
3. **Sequence Processing**: For each (current, next) pair:
   - Calculate alignment with target and negative samples
   - Apply contrastive loss
   - Propagate context through connected nodes
   - Update graph weights

### Inference Pipeline
1. **Context Initialization**: Set starting context vector
2. **Beam Search**: Maintain top-k sequences
3. **Graph Traversal**: Score candidates using complex tensor alignment
4. **Context Update**: Evolve context based on selected tokens
5. **Generation**: Continue until stopping criteria met

## Design Principles

### 1. Modularity
Each component (complex tensors, context propagation, graph operations) can be modified independently

### 2. Interpretability
Graph structure provides clear decision paths that can be visualized and analyzed

### 3. Scalability
Sparse graph operations scale better than dense matrix operations for large vocabularies

### 4. Experimentation-Friendly
Configuration-driven design allows easy hyperparameter exploration

## Evolution from Version 1

### Key Improvements
- **Backend**: Redis/MongoDB → Neo4j for better graph operations
- **Mathematics**: Real vectors → Complex tensors for more expressivity
- **Training**: Multiple approaches → Focused contrastive learning
- **Architecture**: Experimental → Production-ready modular design

### Lessons Learned
- Graph databases are essential for efficient subgraph operations
- Complex number representations provide meaningful benefits
- Context propagation requires careful threshold management
- Modular design enables rapid experimentation