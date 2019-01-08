    context 'with an invalid image url' do
      let(:img_url) { "https://invalide_url" }

      it 'adds an error on invalid filetype' do
        allow(PullTempfile).to receive(:transaction).and_raise(Errno::ECONNRESET)
        expect(operation).to receive(:pull_image_error) # no need stub
        execute_operation
      end

      it 'adds an error on invalid filetype' do
        allow(PullTempfile).to receive(:transaction).and_raise(Errno::ECONNRESET)
        allow(operation).to receive(:pull_image_error) # necessory 
        execute_operation
        expect(operation).to have_received(:pull_image_error)
      end

    end