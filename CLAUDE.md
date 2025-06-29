# Word-Tree Project Memory

## Memory Bank System - MANDATORY

This project uses a **Memory Bank System** for context management. At the start of EVERY session, you MUST:

1. **Read ALL memory bank files** in `.claude/` directory:
   - `project-brief.md` - Core project goals and structure
   - `product-context.md` - Problem space and user experience goals
   - `system-patterns.md` - Architecture patterns and component relationships
   - `tech-context.md` - Technology stack and development setup
   - `active-context.md` - Current work focus and recent changes
   - `progress.md` - What works, what's left, current status

2. **Query long-term memory** for additional project context using `mcp__long_term_memory__find`

3. **Establish continuity** by combining memory bank + long-term memory + current request

## Project Overview

Word-Tree is a research project exploring **graph-based neural language models** as alternatives to transformer architectures. Key innovations:

- **Complex Tensor Mathematics**: Polar representation with discrete quantization
- **Graph-Native Architecture**: Subwords as nodes, contextual weights as edges
- **Context Propagation**: Dynamic threshold-based activation system
- **Neo4j Integration**: Production-ready graph database backend

## Current Status

- **Phase**: Understanding complete, ready for deep analysis
- **Version 2**: Mature implementation with modular architecture
- **Focus**: Performance characterization and experimental exploration

## Memory Management Protocol

### Session Start (MANDATORY)
```
1. Query long-term memory for "word-tree" context
2. Read ALL 6 memory bank files in .claude/
3. Ask user for session mode (Production/Prototyping/Exploration)
4. Synthesize complete context before starting work
```

### Update Triggers
Update memory bank when:
- Significant architectural discoveries made
- New patterns or tools identified
- User requests "update memory bank"
- Complex multi-session work completed

### Documentation Strategy
- **Memory Bank**: Project-specific context and continuity
- **Long-term Memory**: Cross-project patterns and learnings
- **Knowledge Graph**: Link concepts across sessions and projects

## Key Commands

- **Lint/Type Check**: TBD - check package.json or ask user
- **Testing**: TBD - determine testing approach from codebase
- **Development**: Python-based with Neo4j backend

## Session Mode Preferences

User typically works in **Exploration Mode** for this project:
- Learning-oriented approach
- Quick experiments and proof-of-concepts
- Educational insights and architectural understanding
- Minimal viable code for understanding complex systems