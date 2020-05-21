/*
 * Copyright 2020 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package io.netty.buffer;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public abstract class AbstractBenchmark {

    protected static final int PAGE_SIZE = 8192;
    protected static final int MAX_ORDER = 11;
    protected static final int CHUNK_SIZE = PAGE_SIZE << MAX_ORDER;

    protected static final PooledByteBufAllocator ALLOCATOR = new PooledByteBufAllocator(1, 0, PAGE_SIZE, MAX_ORDER);

    protected void startBench(String fileName) throws IOException {
        //the result file
        String p = System.getProperty("user.dir") + "/benchmark/src/main/matlab/" + fileName;
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(p));
            doBench(writer);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * do benchmark
     *
     * @param writer
     */
    protected abstract void doBench(Writer writer) throws IOException;
}
